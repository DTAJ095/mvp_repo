from django.db import models

# Create your models here.


class FlightsAvailable(models.Model):
    plane = models.CharField(max_length=50, null=False, default=None)
    flight_class = models.CharField(max_length=50, null=False, default='Economy')
    price = models.DecimalField(default=0, null=False, max_digits=10, decimal_places=2)
    
    
class AirportCompany(models.Model):
    company = models.CharField(max_length=250, null=False, default=None)
    location = models.CharField(max_length=20, null=False, default=None)
    address = models.CharField(max_length=50, null=False, default=None)
    flight_available = models.ForeignKey(FlightsAvailable, on_delete=models.CASCADE, default=0)
    description = models.TextField(default=None, blank=True)
    
    def __str__(self):
        return f"{self.company} {self.location}"


class RoomsAvailable(models.Model):
    rooms_type = models.CharField(max_length=50, default=None)
    number_of_guest = models.IntegerField(default=0)
    room_image = models.ImageField(upload_to='room_images/', default=None, blank=False)
    price_per_night = models.DecimalField(default=0, null=False, max_digits=10, decimal_places=2)
    
    def __str__(self):
        return f"{self.rooms_type} ({self.number_of_guest})"
    

class Hotel(models.Model):
    hotel_name = models.CharField(primary_key=True, unique=True, default=None, max_length=100, null=False)
    location = models.CharField(max_length=20, null=False, default=None)
    address = models.CharField(max_length=50, null=False, default=None)
    standing = models.CharField(max_length=20, default=None)
    rooms = models.ManyToManyField(RoomsAvailable)
    image = models.ImageField(upload_to='hotel_images/', default=None)
    description = models.TextField(default=None, blank=True)
    
    def __str__(self):
        return f"{self.hotel_name}, {self.location}"
