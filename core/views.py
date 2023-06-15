from django.shortcuts import render, redirect
from .models import *
from .forms import *
from django.contrib import messages
from django.core.paginator import Paginator
import datetime
from .serializers import *
from rest_framework import viewsets
import requests
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required, user_passes_test
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

## VIEWS - URLS - HTML

def index(request):
    productosAll = Producto.objects.all() # SELECT * FROM producto
    page = request.GET.get('page', 1) # OBTENEMOS LA VARIABLE DE LA URL, SI NO EXISTE NADA DEVUELVE 1
    
    try:
        paginator = Paginator(productosAll, 3)
        productosAll = paginator.page(page)
    except:
        raise Http404

    data = {
        'listado': productosAll,
        'paginator': paginator
    }
    return render(request, 'core/index.html', data)


def indexApi(request):
    #OBTIENE DATOS DEL API
    respuesta = requests.get('http://127.0.0.1:8000/api/productos/') # SELECT * FROM producto
    respuesta2 = requests.get('https://mindicador.cl/api')
    respuesta3 = requests.get('https://rickandmortyapi.com/api/character')
    #TRANSFORMAR EL JSON
    productosAll = respuesta.json()
    monedas = respuesta2.json()
    envolvente = respuesta3.json()
    personajes = envolvente['results']

    page = request.GET.get('page', 1) # OBTENEMOS LA VARIABLE DE LA URL, SI NO EXISTE NADA DEVUELVE 1
    
    try:
        paginator = Paginator(productosAll, 3)
        productosAll = paginator.page(page)
    except:
        raise Http404

    data = {
        'listado': productosAll,
        'monedas': monedas,
        'personajes': personajes,
        'paginator': paginator
    }
    return render(request, 'core/indexApi.html', data)

"""
def indexSesion(request):
    return render(request, ('core/indexSesion.html'))
"""

# CRUD PRODUCTO
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

def deleteProducto(request, id):
    producto = Producto.objects.get(id=id)
    producto.delete()
    return redirect(to='adminProductos')
# FIN CRUD PRODUCTO

@grupo_requerido('cliente')
def carrito(request):
    cliente = User.objects.get(username=request.user.username)
    CarritoCliente = Carrito.objects.filter(cliente=cliente)
    existe = CarritoCliente.exists()
    respuesta = requests.get('https://mindicador.cl/api/dolar').json()
    valor_usd = respuesta['serie'][0]['valor']

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
    envio = 1000

    #Total
    total = subtotal-descuento+envio
    total_usd = round(total/valor_usd, 2)

    data = {
        'listado': CarritoCliente,
        'valorusd': valor_usd,
        'totalusd': total_usd,
        'subtotal': subtotal,
        'descuento': descuento,
        'envio': envio,
        'total': total,
        'existe': existe,
        'form': envioForm()
    }

    return render(request, 'core/carrito.html', data)

def compra(request):
    return render(request, ('core/compra.html'))

def cuenta(request):
    return render(request, ('core/cuenta.html'))

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

def login(request):
    return render(request, ('core/login.html'))

def registro(request):
    return render(request, ('core/registro.html'))

def producto(request, id):
    producto = Producto.objects.get(id=id)
    try:
        cliente = User.objects.get(username=request.user.username)
    except Cliente.DoesNotExist:
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
                CarritoCP = Carrito.objects.get(cliente=cliente,producto=producto)
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
                    carrito = Carrito.objects.create(cliente=cliente,producto=producto,cantidad=producto.stock)
                    producto.stock = 0
                else:
                    carrito = Carrito.objects.create(cliente=cliente,producto=producto,cantidad=int(formulario.data["cantidad"]))
                    producto.stock = producto.stock-int(formulario.data["cantidad"])
    producto.save()
            
    return render(request, ('core/producto.html'), data)

"""
def productoSesion(request):
    return render(request, ('core/productoSesion.html'))
"""

def suscripcion(request):
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
    return render(request, 'core/suscripcion.html', data)

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

def miSuscripcion(request):
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
    return render(request, 'core/miSuscripcion.html', data)

# CRUD Suscripcion
def addSuscripcion(request, id):
    cliente = User.objects.get(username=request.user.username)
    tipoSuscripcion = TipoSuscripcion.objects.get(id=id)
    suscripcion = Suscripcion.objects.create(cliente=cliente, suscripcion=tipoSuscripcion)
    return redirect(to='suscripcion')

def deleteSuscripcion(request, id):
    cliente = User.objects.get(username=request.user.username)
    suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
    suscripcionCliente.delete()
    return redirect(to='suscripcion')

def updateSuscripcion(request, id):
    cliente = User.objects.get(username=request.user.username)
    tipoSuscripcion = TipoSuscripcion.objects.get(id=id)
    suscripcionCliente = Suscripcion.objects.get(cliente=cliente)
    suscripcionCliente.suscripcion = tipoSuscripcion
    suscripcionCliente.save()
    return redirect(to='suscripcion')
# FIN CRUD Suscripcion

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

def recuperarPass(request):
    return render(request, ('core/recuperarPass.html'))

def base(request):
    return render(request, ('core/base.html'))

def administracion(request):
    return render(request, ('core/administracion.html'))

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

# CRUD CARRITO
def deleteCarrito(request, id):
    itemCarrito = Carrito.objects.get(id=id)
    producto = Producto.objects.get(nombre=itemCarrito.producto.nombre)
    producto.stock = producto.stock+itemCarrito.cantidad
    producto.save()
    itemCarrito.delete()
    return redirect(to='carrito')
# FIN CRUD CARRITO

