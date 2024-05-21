from django.db import models

# Create your models here.

class User(models.Model):
    first_name = models.CharField(null=False, default=None, max_length=250)
    last_name = models.CharField(default=None, max_length=250)
    phone = models.CharField(null=False, default=None, max_length=30)
    password = models.CharField(null=False, max_length=50)
    
    def __str__(self):
        return self.first_name


class HotelBook(models.Model):
    book_id = models.AutoField(primary_key=True, default=None, null=False)
    client_name = models.CharField(max_length=50, default=None, null=False)
    phone = models.CharField(max_length=20, null=False, default=None)
    hotel_name = models.CharField(max_length=100, null=False, default=None)
    room = models.CharField(max_length=50, null=False, default=None)
    check_in = models.DateField(blank=False, null=False, max_length=50)
    check_out = models.DateField(blank=False, null=False, max_length=50)
    created_date = models.DateField(auto_now_add=True, blank=False, null=False, max_length=50)
    
    def __str__(self):
        return f"{self.client_name}, {self.phone}"
