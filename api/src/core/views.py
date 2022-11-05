from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated

from .serializers import (
    ItemSerializer,
    ItemPatchSerializer,
)
from .models import Item

# Create your views here.


class ItemViewSet(ModelViewSet):

    permission_classes = [IsAuthenticated]
    queryset = Item.objects.all()

    def get_serializer_class(self):
        if self.request.method == 'PATCH':
            return ItemPatchSerializer
        return ItemSerializer

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

    def perform_update(self, serializer):
        serializer.save(buyer=self.request.user)
