from rest_framework import serializers
from booking.models import Hotel, RoomsAvailable


class HotelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Hotel
        fields = ['hotel_name', 'location', 'address', 'description', 'standing', 'rooms']


class RoomsSerializer(serializers.ModelSerializer):
    class Meta:
        model = RoomsAvailable
        fields = ['room_type', 'number_of_guest', 'price_per_night']