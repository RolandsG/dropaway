from rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly

from .serializers import (
    ItemSerializer,
)
from .models import Item

# Create your views here.


class ItemViewSet(ModelViewSet):

    permission_classes = [IsAuthenticatedOrReadOnly]
    serializer_class = ItemSerializer
    http_method_names = ["get", "post"]
    queryset = Item.objects.all()

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)


class ItemOrderViewSet(ModelViewSet):

    permission_classes = [IsAuthenticated]
    serializer_class = ItemSerializer
    http_method_names = ["patch"]
    queryset = Item.objects.all()

    def perform_update(self, serializer):
        serializer.save(buyer=self.request.user,
                        status="SCHEDULED")


class UserItemViewSet(ModelViewSet):
    permission_classes = [IsAuthenticated]
    http_method_names = ["get"]
    queryset = Item.objects.all()
    serializer_class = ItemSerializer

    def get_queryset(self):
        return Item.objects.filter(user=self.request.user)
