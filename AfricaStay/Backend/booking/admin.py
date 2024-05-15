from django.contrib import admin
from booking.models import Hotel, AirportCompany, RoomsAvailable, FlightsAvailable

# Register your models here.

admin.site.register(RoomsAvailable)
admin.site.register(Hotel)
admin.site.register(AirportCompany)
admin.site.register(FlightsAvailable)
