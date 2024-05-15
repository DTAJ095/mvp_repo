from django.db import models
from booking.models import Hotel, RoomsAvailable

# Create your models here.

class User(models.Model):
    first_name = models.CharField(null=False, default=None, max_length=250)
    last_name = models.CharField(default=None, max_length=250)
    phone = models.CharField(null=False, default=None, max_length=30)
    password = models.CharField(null=False, max_length=50)
    
    def __str__(self):
        return self.first_name


class HotelBook(models.Model):
    client_name = models.CharField(max_length=50, default=None, null=False)
    phone = models.CharField(max_length=20, null=False, default=None)
    hotel_name = models.ForeignKey(Hotel, on_delete=models.CASCADE)
    room = models.ForeignKey(RoomsAvailable, on_delete=models.CASCADE, default=None)
    check_in = models.DateField(blank=True, null=False)
    check_out = models.DateField(blank=True, null=False)
    created_date = models.DateField(blank=True, null=False, default=None)
    
    def __str__(self):
        return f"{self.client_name}, {self.phone}"
