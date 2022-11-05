from rest_framework.routers import DefaultRouter
from django.urls import path

from .views import (
    ItemViewSet,
    UserItemViewSet,
    ItemOrderViewSet,
    DeliveryFeeView,
)

router = DefaultRouter()

router.register("items", ItemViewSet, basename="items")
router.register("user-items", UserItemViewSet, basename="user-items")
router.register("order-item", ItemOrderViewSet, basename="order-item")

urlpatterns = [
    path('delivery-fee', DeliveryFeeView.as_view(), name="delivery-fee"),
]

urlpatterns = router.urls + urlpatterns
