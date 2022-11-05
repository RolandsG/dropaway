from rest_framework.routers import DefaultRouter

from .views import (
    ItemViewSet,
    UserItemViewSet,
    ItemOrderViewSet,
)

router = DefaultRouter()

router.register("items", ItemViewSet, basename="items")
router.register("user-items", UserItemViewSet, basename="user-items")
router.register("order-item", ItemOrderViewSet, basename="order-item")

urlpatterns = router.urls
