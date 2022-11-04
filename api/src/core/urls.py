from rest_framework.routers import DefaultRouter

from .views import (
    ItemViewSet,
)

router = DefaultRouter()

router.register("Items", ItemViewSet, basename="Items")

urlpatterns = router.urls
