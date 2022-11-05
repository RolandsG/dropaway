import requests
from rest_framework.response import Response
from rest_framework.views import APIView
from django_filters import rest_framework as filters

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
    filter_backends = (filters.DjangoFilterBackend,)
    filterset_fields = ('status',)

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


class DeliveryOrderView(APIView):

    def get(self, request, *args, **kwargs):

        item_id = request.query_params["item_id"]
        dropoff = request.query_params["dropoff"]

        item = Item.objects.get(pk=item_id)

        # call another api for POST
        url = 'https://daas-public-api.development.dev.woltapi.com/merchants/6364e0098018ce361efafca7/delivery-order'
        data = {
            "pickup": {
                "location": {
                    "formatted_address": item.pickup_location
                },
                "comment": "The box is in front of the door",
                "contact_details": {
                    "name": "John Doe",
                    "phone_number": "+358123456789",
                    "send_tracking_link_sms": False
                }
            },
            "dropoff": {
                "location": {
                    "formatted_address": dropoff
                },
                "contact_details": {
                    "name": "John Doe's wife",
                    "phone_number": "+358123456789",
                    "send_tracking_link_sms": False
                },
                "comment": "Leave at the door, please"
            },
            "customer_support": {
                "email": "string",
                "phone_number": "string",
                "url": "string"
            },
            "is_no_contact": True,
            "contents": [
                {
                    "count": 1,
                    "description": item.description,
                    "identifier": str(item.id),
                    "tags": []
                }
            ],
            "tips": [],
            "min_preparation_time_minutes": 10,
        }
        headers = {
            "Content-Type": "application/json",
            "Authorization": "Bearer hPklgvFdpMgC8mNt8Z7OiiYdBqJZMi4RBwqsQnJ60c4"
        }

        api_call = requests.post(url, headers=headers, json=data)

        return Response(data=api_call.json())
