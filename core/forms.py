# FORMULARIO PARA AGREGAR Y ACTUALIZAR 
from django import forms
from django.forms import ModelForm
from .models import *

class ProductoForm (ModelForm):
        
    nombre = forms.CharField(widget=forms.TextInput(attrs={"placeholder":"Ingrese Nombre"}))
    precio = forms.IntegerField(min_value=0,widget=forms.NumberInput(attrs={"placeholder":"Ingrese Precio"}))
    stock = forms.IntegerField(min_value=0,widget=forms.NumberInput(attrs={"placeholder":"Ingrese Stock"}))
    descripcion = forms.CharField(min_length=10,max_length=200,widget=forms.Textarea(attrs={"rows":4}))

    class Meta:
        model = Producto
        #fields = ['nombre','precio','stock','descripcion','tipo']
        fields = '__all__'

        widgets = {
                'fecha' : forms.SelectDateWidget(years=range(1940,2023))
        }


class CantidadForm (ModelForm):
    cantidad = forms.IntegerField(min_value=1 ,widget=forms.NumberInput(attrs={"placeholder":"Ingrese Cantidad"}))

    class Meta:
        model = Carrito
        fields = ['cantidad']

class CarritoForm (ModelForm):
    cliente = forms.CharField()
    producto = forms.IntegerField()
    cantidad = forms.IntegerField(min_value=1, max_value=5 ,widget=forms.NumberInput(attrs={"placeholder":"Ingrese Cantidad"}))

    class Meta:
        model = Carrito
        fields = ['cantidad']

class envioForm (ModelForm):
    direccion = forms.CharField(widget=forms.TextInput(attrs={"placeholder":"Ingrese Dirección"}))
    contacto = forms.CharField(widget=forms.TextInput(attrs={"placeholder":"Ingrese Contacto"}))

    class Meta:
        model = Compras
        fields = ['direccion','contacto']


