from django.db import models
from django.contrib.auth.models import User
import uuid

# Create your models here.

# ES DONDE SE CREAN LAS TABLAS
class TipoProducto(models.Model):
    descripcion = models.CharField(max_length=50)

    def __str__(self):
        return self.descripcion

class Producto(models.Model):
    nombre = models.CharField(max_length=50)
    precio = models.IntegerField()
    stock = models.IntegerField()
    descripcion = models.CharField(max_length=250)
    tipo = models.ForeignKey(TipoProducto, on_delete=models.CASCADE)
    fecha = models.DateField()
    imagen = models.ImageField(null=True, blank=True)
    vigente = models.BooleanField()

    def __str__(self):
        return self.nombre
    
    
class Cliente(models.Model):
    usuario = models.CharField(max_length=50, unique=True)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    email = models.EmailField(max_length=50)
    password = models.CharField(max_length=50)

    def __str__(self):
        return self.usuario
    
class Carrito(models.Model):
    cliente = models.ForeignKey(User, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.IntegerField()
    vigente = models.BooleanField()

    def __str__(self):
        return self.cliente.username
    
class TipoEstado(models.Model):
    descripcion = models.CharField(max_length=50)

    def __str__(self):
        return self.descripcion
    

class Compras(models.Model):
    codigo = models.CharField(max_length=20)
    cliente = models.ForeignKey(User, on_delete=models.CASCADE)
    carrito = models.ForeignKey(Carrito, on_delete=models.CASCADE)
    direccion = models.CharField(max_length=50)
    contacto = models.CharField(max_length=50)
    fecha = models.DateField()
    estado = models.ForeignKey(TipoEstado, on_delete=models.CASCADE)

    def __str__(self):
        return self.codigo
    
class Boleta(models.Model):
    codigo = models.CharField(max_length=20)
    subtotal = models.IntegerField()
    descuento = models.IntegerField()
    total = models.IntegerField()
    def __str__(self):
        return self.codigo
    
class TipoSuscripcion(models.Model):
    nombre = models.CharField(max_length=50)
    precio = models.IntegerField()

    def __str__(self):
        return self.nombre
    
class Suscripcion(models.Model):
    cliente = models.ForeignKey(User, on_delete=models.CASCADE)
    suscripcion = models.ForeignKey(TipoSuscripcion, on_delete=models.CASCADE)
    fecha = models.DateField()

    def __str__(self):
        return self.cliente.username