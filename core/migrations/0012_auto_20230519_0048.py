# Generated by Django 3.1.2 on 2023-05-19 04:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0011_auto_20230519_0043'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='carrito',
            name='producto',
        ),
        migrations.AddField(
            model_name='carrito',
            name='producto',
            field=models.ManyToManyField(to='core.Producto'),
        ),
    ]
