# Generated by Django 3.1.2 on 2023-06-28 22:49

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0021_compras_estado'),
    ]

    operations = [
        migrations.AddField(
            model_name='compras',
            name='codigo',
            field=models.UUIDField(default=uuid.uuid4, unique=True),
        ),
    ]