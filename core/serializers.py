# NOS VA A PERMITIR CONVERTIR LA DATA
from .models import *
from rest_framework import serializers

class TipoProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoProducto
        fields = '__all__'

class ProductoSerializer(serializers.ModelSerializer):
    tipo = TipoProductoSerializer(read_only=True)
    class Meta:
        model = Producto
        fields = '__all__'

class TipoSuscripcionSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoSuscripcion
        fields = '__all__'

class SuscripcionSerializer(serializers.ModelSerializer):
    suscripcion = TipoSuscripcionSerializer(read_only=True)
    class Meta:
        model = Suscripcion
        fields = '__all__'


