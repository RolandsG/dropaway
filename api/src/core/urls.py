from rest_framework.routers import DefaultRouter
from django.urls import path

from .views import (
    ItemViewSet,
    UserItemViewSet,
    UserOrderedItemViewSet,
    ItemOrderViewSet,
    DeliveryFeeView,
    DeliveryOrderView,
)

router = DefaultRouter()

router.register("items", ItemViewSet, basename="items")
router.register("user-items", UserItemViewSet, basename="user-items")
router.register("user-ordered-items", UserOrderedItemViewSet, basename="user-ordered-items")
router.register("order-item", ItemOrderViewSet, basename="order-item")

urlpatterns = [
    path('delivery-fee', DeliveryFeeView.as_view(), name="delivery-fee"),
    path('delivery-order', DeliveryOrderView.as_view(), name="delivery-order"),
]

urlpatterns = router.urls + urlpatterns
