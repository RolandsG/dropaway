from django.db import models
import uuid

# Create your models here.

class Item(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user_id = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    category = models.CharField(max_length=100, unique=True)
    title = models.CharField(max_length=100, unique=True)
    description = models.CharField(max_length=100, unique=True)
    photo_src = models.CharField(max_length=100, unique=True)
    buyer = models.CharField(max_length=100, unique=True)
    status = models.CharField(max_length=100, unique=True)
    wolt_link = models.CharField(max_length=100, unique=True)
    dimensions = models.CharField(max_length=100, unique=True)
    weight = models.CharField(max_length=100, unique=True)
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title
