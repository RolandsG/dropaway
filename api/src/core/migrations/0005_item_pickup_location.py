# Generated by Django 4.1.3 on 2022-11-05 18:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_item_condition_alter_item_category'),
    ]

    operations = [
        migrations.AddField(
            model_name='item',
            name='pickup_location',
            field=models.CharField(default='', max_length=200),
            preserve_default=False,
        ),
    ]
