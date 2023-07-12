from django.shortcuts import render, redirect
from .models import *
from .forms import *
from django.contrib import messages
from django.core.paginator import Paginator
import datetime
from datetime import date
from .serializers import *
from rest_framework import viewsets
import requests
from django.contrib.auth.models import User,Group
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth import authenticate, login
import uuid
from dateutil.relativedelta import relativedelta
# Create your views here.

#FUNCION GENERICA QUE VALIDA EL GRUPO DEL USUARIO
def grupo_requerido(nombre_grupo):
    def decorator(view_fuc):
        @user_passes_test(lambda user: user.groups.filter(name=nombre_grupo).exists())
        def wrapper(request, *arg, **kwargs):
            return view_fuc(request, *arg, **kwargs)
        return wrapper
    return decorator

# @grupo_requerido('vendedor')
# CUANDO CREAN EL USUARIO LO ASIGNA INMEDIATAMENTE AL GRUPO
# grupo = Grupo.objects.get(name='cliente')
# user.groups.add(grupo)

# NOS PERMITE MOSTRAR LA INFO
class ProductoViewset(viewsets.ModelViewSet):
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializer

class TipoProductoViewset(viewsets.ModelViewSet):
    queryset = TipoProducto.objects.all()
    serializer_class = TipoProductoSerializer

class TipoSuscripcionViewset(viewsets.ModelViewSet):
    queryset = TipoSuscripcion.objects.all()
    serializer_class = TipoSuscripcionSerializer

class SuscripcionViewset(viewsets.ModelViewSet):
    queryset = Suscripcion.objects.all()
    serializer_class = SuscripcionSerializer

## VIEWS - URLS - HTML

def index(request):
    #OBTIENE DATOS DEL API
    respuesta = requests.get('http://127.0.0.1:8000/api/productos/') # SELECT * FROM producto
    respuesta2 = requests.get('https://mindicador.cl/api')
    respuesta3 = requests.get('https://rickandmortyapi.com/api/character')
    #TRANSFORMAR EL JSON
    productosAll = respuesta.json()
    monedas = respuesta2.json()
    #envolvente = respuesta3.json()
    #personajes = envolvente['results']

    page = request.GET.get('page', 1) # OBTENEMOS LA VARIABLE DE LA URL, SI NO EXISTE NADA DEVUELVE 1
    
    try:
        paginator = Paginator(productosAll, 3)
        productosAll = paginator.page(page)
    except:
        raise Http404
    
    try:
        cliente = User.objects.get(username=request.user.username)
        try:
            suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
            if suscripcionCliente.fecha < datetime.datetime.now().date():
                suscripcionCliente.delete()
        except Suscripcion.DoesNotExist:
            suscripcionCliente = None
    except User.DoesNotExist:
        cliente = None

    flag = usuario_pertenece_a_grupo(request.user.username, 'administradores')

    data = {
        'listado': productosAll,
        'monedas': monedas,
        #'personajes': personajes,
        'isadmin': flag,
        'paginator': paginator
    }
    return render(request, 'core/index.html', data)


# CRUD PRODUCTO
@login_required
@grupo_requerido('vendedor')
def addProducto(request):
    data = {
        'form' : ProductoForm()
    }
    
    if request.method == 'POST':
        formulario = ProductoForm(request.POST, files=request.FILES) # OBTIENE LA DATA DEL FORMULARIO
        if formulario.is_valid():
            formulario.save() 
            #data['msj'] = "Producto guardado correctamente"
            messages.success(request, "Producto almacenado correctamente")

    return render(request, 'core/addProducto.html', data)

@login_required
@grupo_requerido('vendedor')
def updateProducto(request, id):
    producto = Producto.objects.get(id=id) #OBTIENE UN PRODUCTO POR EL ID
    data = {
        'form' : ProductoForm(instance=producto) # CARGAMOS EL PRODUCTO EN EL FORM
    }
    
    if request.method == 'POST':
        formulario = ProductoForm(request.POST, instance=producto, files=request.FILES) # OBTIENE LA DATA DEL FORMULARIO
        if formulario.is_valid():
            formulario.save() 
            #data['msj'] = "Producto actualizado correctamente"
            messages.success(request, "Producto almacenado correctamente")
            data['form'] = formulario #CARGA LA NUEVA INFO EN EL FORM
            
    return render(request, 'core/updateProducto.html', data)

@login_required
@grupo_requerido('vendedor')
def deleteProducto(request, id):
    producto = Producto.objects.get(id=id)
    producto.delete()
    return redirect(to='adminProductos')
# FIN CRUD PRODUCTO

def generar_id_random():
    id_random = str(uuid.uuid4())[:5]
    while Compras.objects.filter(codigo=id_random).exists():
        id_random = str(uuid.uuid4())[:5]
    return id_random

@login_required
@grupo_requerido('cliente')
def agregarCompra(request):
    cliente = User.objects.get(username=request.user.username)
    carritoCliente = Carrito.objects.filter(cliente=cliente, vigente=True)
    estado = TipoEstado.objects.get(descripcion='Validación')

    subtotal = sum(carrito.producto.precio*carrito.cantidad for carrito in carritoCliente)
    # Descuento Suscripcion
    try:
        suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
    except Suscripcion.DoesNotExist:
        suscripcionCliente = None
    if suscripcionCliente != None:
        descuento = round(subtotal*0.05)
    else:
        descuento = 0
    total = subtotal-descuento

    if request.method == 'POST':
        formulario = envioForm(request.POST) # OBTIENE LA DATA DEL FORMULARIO
        if formulario.is_valid():
            #formulario.save()
            codigo = generar_id_random()
            for carrito in carritoCliente:
                Compras.objects.create(codigo=codigo,cliente=cliente, carrito=carrito, direccion=formulario.cleaned_data["direccion"], contacto=formulario.cleaned_data["contacto"], fecha = datetime.datetime.now() , estado = estado)
                carrito.vigente = False
                carrito.save()
            Boleta.objects.create(codigo=codigo,subtotal=subtotal,descuento=descuento,total=total)
    return redirect(to='/cuenta/')
    #return render(request, 'core/cuenta.html')

@login_required
@grupo_requerido('cliente')
def cuenta(request):
    cliente = User.objects.get(username=request.user.username)
    comprasCliente = Compras.objects.filter(cliente=cliente).order_by('-id')
    existe = comprasCliente.exists()

    page = request.GET.get('page', 1) # OBTENEMOS LA VARIABLE DE LA URL, SI NO EXISTE NADA DEVUELVE 1
    
    try:
        paginator = Paginator(comprasCliente, 3)
        comprasCliente = paginator.page(page)
    except:
        raise Http404

    data = {
        'listado': comprasCliente,
        'existe': existe,
        'paginator': paginator
    }
    return render(request, 'core/cuenta.html', data)

@login_required
@grupo_requerido('cliente')
def carrito(request):
    cliente = User.objects.get(username=request.user.username)
    CarritoCliente = Carrito.objects.filter(cliente=cliente, vigente=True)
    existe = CarritoCliente.exists()
    respuesta = requests.get('https://mindicador.cl/api/dolar').json()
    valor_usd = respuesta['serie'][0]['valor']

    #Subtotal Carrito
    subtotal = sum(carrito.producto.precio*carrito.cantidad for carrito in CarritoCliente)

    # Descuento Suscripcion

    try:
        suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
        if suscripcionCliente.fecha < datetime.datetime.now().date():
            suscripcionCliente.delete()
    except Suscripcion.DoesNotExist:
        suscripcionCliente = None



    if suscripcionCliente != None:
        descuento = round(subtotal*0.05)
    else:
        descuento = 0

    #Envio
    #envio = 1000

    #Total
    #total = subtotal-descuento+envio
    total = subtotal-descuento
    total_usd = round(total/valor_usd, 2)

    data = {
        'listado': CarritoCliente,
        'valorusd': valor_usd,
        'totalusd': total_usd,
        'subtotal': subtotal,
        'descuento': descuento,
        #'envio': envio,
        'total': total,
        'existe': existe,
        'form': envioForm()
    }

    return render(request, 'core/carrito.html', data)


def tienda(request):
    productosAll = Producto.objects.all() # SELECT * FROM producto
    page = request.GET.get('page', 1) # OBTENEMOS LA VARIABLE DE LA URL, SI NO EXISTE NADA DEVUELVE 1
    
    try:
        paginator = Paginator(productosAll, 9)
        productosAll = paginator.page(page)
    except:
        raise Http404

    data = {
        'listado': productosAll,
        'paginator': paginator
    }
    return render(request, 'core/tienda.html', data)

"""
def tiendaSesion(request):
    return render(request, ('core/tiendaSesion.html'))
"""
"""
def login(request):
    return render(request, ('core/login.html'))
"""
def registro(request):
    data = {
        'form': RegistroForm()
    }

    if request.method == 'POST':
        formulario = RegistroForm(data=request.POST) # OBTIENE LA DATA DEL FORMULARIO
        if formulario.is_valid():
            formulario.save()
            user = authenticate(username = formulario.cleaned_data["username"], password = formulario.cleaned_data["password1"])
            login(request, user)
            #messages.success(request, "Te has registrado correctamente!")
            grupo = Group.objects.get(name='cliente')
            user.groups.add(grupo)
            #redirigir al home
            return redirect(to="index")
        data["form"]=formulario
    return render(request, 'core/registro.html', data)

@login_required
@grupo_requerido('cliente')
def compra(request,id):
    compra = Compras.objects.get(id=id)
    totalxproducto = compra.carrito.producto.precio*compra.carrito.cantidad
    boleta = Boleta.objects.get(codigo=compra.codigo)
    data = {
        'boleta': boleta,
        'compra': compra,
        'total': totalxproducto
    }

    return render(request, 'core/compra.html', data)

@login_required
@grupo_requerido('administradores')
def seguimiento(request,id):
    compra = Compras.objects.get(id=id)
    totalxproducto = compra.carrito.producto.precio*compra.carrito.cantidad
    data = {
        'compra': compra,
        'total': totalxproducto
    }

    return render(request, 'core/seguimiento.html', data)

# SEGUIMIENTO
@login_required
@grupo_requerido('administradores')
def estadoValidacion(request, id):
    compra = Compras.objects.get(id=id)
    estado = TipoEstado.objects.get(descripcion='Validación')
    compra.estado = estado
    compra.save()
    return redirect(to='adminSeguimiento')

@login_required
@grupo_requerido('administradores')
def estadoPreparacion(request, id):
    compra = Compras.objects.get(id=id)
    estado = TipoEstado.objects.get(descripcion='Preparación')
    compra.estado = estado
    compra.save()
    return redirect(to='adminSeguimiento')

@login_required
@grupo_requerido('administradores')
def estadoReparto(request, id):
    compra = Compras.objects.get(id=id)
    estado = TipoEstado.objects.get(descripcion='Reparto')
    compra.estado = estado
    compra.save()
    return redirect(to='adminSeguimiento')

@login_required
@grupo_requerido('administradores')
def estadoEntregado(request, id):
    compra = Compras.objects.get(id=id)
    estado = TipoEstado.objects.get(descripcion='Entregado')
    compra.estado = estado
    compra.save()
    return redirect(to='adminSeguimiento')

def producto(request, id):
    producto = Producto.objects.get(id=id)
    try:
        cliente = User.objects.get(username=request.user.username)
    except User.DoesNotExist:
        cliente = None
    data = {
        'producto': producto,
        'usuario': request.user.username,
        'form' : CantidadForm(initial={'cantidad': 1})
    }

    if request.method == 'POST':
        formulario = CantidadForm(request.POST, files=request.FILES) # OBTIENE LA DATA DEL FORMULARIO
        if formulario.is_valid():
            try:
                CarritoCP = Carrito.objects.get(cliente=cliente,producto=producto,vigente=True)
                cantidadstock = CarritoCP.cantidad+producto.stock
                CarritoCP.cantidad = CarritoCP.cantidad + int(formulario.data["cantidad"])
                if CarritoCP.cantidad > cantidadstock:
                    CarritoCP.cantidad = cantidadstock
                    CarritoCP.save()
                    producto.stock = 0
                else:
                    CarritoCP.save()
                    producto.stock = producto.stock-int(formulario.data["cantidad"])
            except Carrito.DoesNotExist:
                if int(formulario.data["cantidad"]) > producto.stock:
                    carrito = Carrito.objects.create(cliente=cliente,producto=producto,cantidad=producto.stock,vigente=True)
                    producto.stock = 0
                else:
                    carrito = Carrito.objects.create(cliente=cliente,producto=producto,cantidad=int(formulario.data["cantidad"]),vigente=True)
                    producto.stock = producto.stock-int(formulario.data["cantidad"])
    producto.save()
            
    return render(request, ('core/producto.html'), data)

"""
def productoSesion(request):
    return render(request, ('core/productoSesion.html'))
"""
@login_required
@grupo_requerido('cliente')
def suscripcion(request):
    basica = TipoSuscripcion.objects.get(id=1)

    respuesta = requests.get('https://mindicador.cl/api/dolar').json()
    valor_usd = respuesta['serie'][0]['valor']
    total_usd = round(basica.precio/valor_usd, 2)

    intermedia = TipoSuscripcion.objects.get(id=2)
    alta = TipoSuscripcion.objects.get(id=3)
    
    try:
        cliente = User.objects.get(username=request.user.username)
        try:
            suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
            if suscripcionCliente.fecha < datetime.datetime.now().date():
                suscripcionCliente.delete()
        except Suscripcion.DoesNotExist:
            suscripcionCliente = None
    except User.DoesNotExist:
        cliente = None


    data = {
        'basica': basica,
        'intermedia': intermedia,
        'alta' : alta,
        'suscripcionCliente' : suscripcionCliente,
        'totalusd' : total_usd

    }
    return render(request, 'core/suscripcion.html', data)

@login_required
@grupo_requerido('cliente')
def suscripcionAdmin(request):
    basica = TipoSuscripcion.objects.get(id=1)
    intermedia = TipoSuscripcion.objects.get(id=2)
    alta = TipoSuscripcion.objects.get(id=3)
    
    cliente = User.objects.filter(username=request.user.username)[:1]
    try:
        suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
    except Suscripcion.DoesNotExist:
        suscripcionCliente = None

    data = {
        'basica': basica,
        'intermedia': intermedia,
        'alta' : alta,
        'suscripcionCliente' : suscripcionCliente

    }
    return render(request, 'core/suscripcionAdmin.html', data)

@login_required
@grupo_requerido('cliente')
def miSuscripcion(request):
    basica = TipoSuscripcion.objects.get(id=1)
    intermedia = TipoSuscripcion.objects.get(id=2)
    alta = TipoSuscripcion.objects.get(id=3)

    try:
        cliente = User.objects.get(username=request.user.username)
        try:
            suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
            if suscripcionCliente.fecha < datetime.datetime.now().date():
                suscripcionCliente.delete()
        except Suscripcion.DoesNotExist:
            suscripcionCliente = None
    except User.DoesNotExist:
        cliente = None

    data = {
        'basica': basica,
        'intermedia': intermedia,
        'alta' : alta,
        'suscripcionCliente' : suscripcionCliente

    }
    return render(request, 'core/miSuscripcion.html', data)

# CRUD Suscripcion
@login_required
@grupo_requerido('cliente')
def addSuscripcion(request, id):
    cliente = User.objects.get(username=request.user.username)
    tipoSuscripcion = TipoSuscripcion.objects.get(id=id)
    un_mes_dsp = datetime.datetime.now()   + relativedelta(months=1)
    suscripcion = Suscripcion.objects.create(cliente=cliente, suscripcion=tipoSuscripcion, fecha=un_mes_dsp)
    return redirect(to='suscripcion')

@login_required
@grupo_requerido('cliente')
def deleteSuscripcion(request, id):
    cliente = User.objects.get(username=request.user.username)
    suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
    suscripcionCliente.delete()
    return redirect(to='suscripcion')

@login_required
@grupo_requerido('cliente')
def updateSuscripcion(request, id):
    cliente = User.objects.get(username=request.user.username)
    tipoSuscripcion = TipoSuscripcion.objects.get(id=id)
    suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
    suscripcionCliente.suscripcion = tipoSuscripcion
    suscripcionCliente.save()
    return redirect(to='suscripcion')
# FIN CRUD Suscripcion

"""
def voucher(request):
    cliente = Cliente.objects.filter(usuario=request.user.username)[:1]
    CarritoCliente = Carrito.objects.filter(cliente=cliente)

    #Subtotal Carrito
    subtotal = sum(carrito.producto.precio*carrito.cantidad for carrito in CarritoCliente)

    # Descuento Suscripcion
    try:
        suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
    except Suscripcion.DoesNotExist:
        suscripcionCliente = None
    if suscripcionCliente != None:
        descuento = round(subtotal*0.05)
    else:
        descuento = 0

    #Envio
    envio = 3000

    #Total
    total = subtotal-descuento+envio

    data = {
        'subtotal': subtotal,
        'descuento': descuento,
        'envio': envio,
        'total': total
    }
    
    if request.method == 'POST':
        formulario = envioForm(request.POST, files=request.FILES) # OBTIENE LA DATA DEL FORMULARIO
        if formulario.is_valid():
            data['direccion'] = formulario.data["direccion"]
            data['contacto'] = formulario.data["contacto"] 
            current_datetime = datetime.datetime.now()  
            data['fecha'] = current_datetime

    CarritoCliente.delete()
    return render(request, 'core/voucher.html', data)
"""
"""
def recuperarPass(request):
    return render(request, ('core/recuperarPass.html'))
"""
def usuario_pertenece_a_grupo(username, group_name):
    try:
        usuario = User.objects.get(username=username)
        grupo = Group.objects.get(name=group_name)
        if usuario.groups.filter(name=group_name).exists():
            return True
        else:
            return False
    except (User.DoesNotExist, Group.DoesNotExist):
        # Manejar el caso en el que el usuario o el grupo no existan
        return False
    
def base(request):
    return render(request, 'core/base.html')

@login_required
@grupo_requerido('vendedor')
def administracion(request):
    return render(request, ('core/administracion.html'))

@login_required
@grupo_requerido('vendedor')
def adminProductos(request):
    productosAll = Producto.objects.all() # SELECT * FROM producto
    page = request.GET.get('page', 1) # OBTENEMOS LA VARIABLE DE LA URL, SI NO EXISTE NADA DEVUELVE 1
    
    try:
        paginator = Paginator(productosAll, 9)
        productosAll = paginator.page(page)
    except:
        raise Http404

    data = {
        'listado': productosAll,
        'paginator': paginator
    }
    return render(request, 'core/adminProductos.html', data)

@login_required
@grupo_requerido('administradores')
def adminSeguimiento(request):
    comprasAll = Compras.objects.all().order_by('-id') # SELECT * FROM producto
    page = request.GET.get('page', 1) # OBTENEMOS LA VARIABLE DE LA URL, SI NO EXISTE NADA DEVUELVE 1
    
    try:
        paginator = Paginator(comprasAll, 9)
        comprasAll = paginator.page(page)
    except:
        raise Http404

    data = {
        'listado': comprasAll,
        'paginator': paginator
    }
    return render(request, 'core/adminSeguimiento.html', data)

# CRUD CARRITO
@login_required
@grupo_requerido('cliente')
def deleteCarrito(request, id):
    itemCarrito = Carrito.objects.get(id=id)
    producto = Producto.objects.get(nombre=itemCarrito.producto.nombre)
    producto.stock = producto.stock+itemCarrito.cantidad
    producto.save()
    itemCarrito.delete()
    return redirect(to='carrito')
# FIN CRUD CARRITO

