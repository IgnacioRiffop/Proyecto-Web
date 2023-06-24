# Generated by Django 3.1.2 on 2023-06-24 05:11

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0018_auto_20230624_0045'),
    ]

    operations = [
        migrations.AddField(
            model_name='compras',
            name='carrito',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='core.carrito'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='compras',
            name='fecha',
            field=models.DateField(default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
