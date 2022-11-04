from django.shortcuts import render
from rest_framework import viewsets, filters

from .serializers import (
    ItemSerializer,
)
from .models import Item

# Create your views here.


class ItemViewSet(viewsets.ModelViewSet):

    serializer_class = ItemSerializer
    queryset = Item.objects.all()

class ItemViewSet(viewsets.ModelViewSet):

    serializer_class = ItemSerializer
    queryset = Item.objects.all()
    filter_backends = [filters.SearchFilter]
    search_fields = ["title"]