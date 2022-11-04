from rest_framework.serializers import ModelSerializer, DecimalField
from rest_framework import filters

from core.models import Item


class ItemSerializer(ModelSerializer):
    class Meta:
        model = Item
        fields = (
            "id",
        )
        read_only_fields = fields
