from django.db import models
import uuid

# Create your models here.


class Item(models.Model):
    STATUSES = (
        ('LISTED', 'Listed'),
        ('SCHEDULED', 'Scheduled'),
        ('DELIVERED', 'Delivered'),
        ('DELETED', 'Deleted'),
    )

    CATEGORIES = (
        ('APPAREL', 'Apparel'),
        ('ELECTRONICS', 'Apparel'),
        ('GARDEN', 'Garden & Outdoors'),
        ('SUPPLIES', 'Supplies'),
        ('SPORT', 'Sporting goods'),
        ('HOME', 'Home goods'),
        ('GAMES', 'Toys and Games'),
        ('OTHER', 'Other'),
    )

    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey("auth.user", related_name="productUser", on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    category = models.CharField(max_length=20, choices=CATEGORIES, default='OTHER')
    description = models.CharField(max_length=500)
    photo_src = models.CharField(max_length=200)
    dimensions = models.CharField(max_length=100)
    status = models.CharField(max_length=20, choices=STATUSES, default='LISTED')
    buyer = models.ForeignKey("auth.user", related_name="productBuyer", on_delete=models.CASCADE, null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title
