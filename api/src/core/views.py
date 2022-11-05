import requests
from rest_framework.response import Response
from rest_framework.views import APIView

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


class DeliveryFeeView(APIView):

    def get(self, request, *args, **kwargs):

        pickup = request.query_params["pickup"]
        dropoff = request.query_params["dropoff"]

        # call another api for POST
        url = 'https://daas-public-api.development.dev.woltapi.com/merchants/6364e0098018ce361efafca7/delivery-fee'
        data = {
            "pickup": {
                "location": {
                    "formatted_address": pickup
                }
            },
            "dropoff": {
                "location": {
                    "formatted_address": dropoff
                }
            }
        }
        headers = {
            "Content-Type": "application/json",
            "Authorization": "Bearer hPklgvFdpMgC8mNt8Z7OiiYdBqJZMi4RBwqsQnJ60c4"
        }

        api_call = requests.post(url, headers=headers, json=data)

        return Response(data=api_call.json())
