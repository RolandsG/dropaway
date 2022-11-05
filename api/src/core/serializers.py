from rest_framework.serializers import ModelSerializer

from .models import Item


class ItemSerializer(ModelSerializer):
    class Meta:
        model = Item
        fields = (
            'id',
            'title',
            'category',
            'description',
            'photo_src',
            'description',
            'dimensions',
            'status',
        )


class ItemPatchSerializer(ModelSerializer):
    class Meta:
        model = Item
        fields = ('buyer',)
