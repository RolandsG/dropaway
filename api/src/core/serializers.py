from rest_framework.serializers import ModelSerializer, DecimalField
from rest_framework import filters

from .models import Item


class ItemSerializer(ModelSerializer):
    class Meta:
        model = Item
        fields = '__all__'
