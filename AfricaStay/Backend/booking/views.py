import rest_framework
import json
from rest_framework.response import Response
from rest_framework import request
from rest_framework import viewsets, status
from booking.models import RoomsAvailable, Hotel, AirportCompany, FlightsAvailable
from africa_stay.settings import DATABASES
from booking.serializers import RoomsSerializer, HotelSerializer


# Create your views here.


class RoomsViews(viewsets.ViewSet):
    def create(self, request):
        """ Add a new room """
        if request.method == 'POST':
            room = RoomsSerializer(data=request.data)
            if room.is_valid():
                if RoomsAvailable.objects.filter(rooms=request.data['rooms_type']).exists():
                    response = dict({
                        "Message": "Room is already available"
                    })
                    return Response(response)
                else:
                    room.save()
                    response = dict({
                        "Message": "Room created"
                    })
                    return Response(response, status=status.HTTP_200_OK)
            else:
                response = dict({
                    "Message": "Failed"
                })
                return Response(response, status=status.HTTP_400_BAD_REQUEST)


class HotelViews(viewsets.ViewSet):
    def create(self, request):
        """ Add a new hotel """
        if request.method == 'POST':
            hotel = HotelSerializer(data=request.data)
            if hotel.is_valid():
                if Hotel.objects.filter(hotel_name=request.data['hotel_name']).exists():
                    response = dict({
                        "Message": "Hotel already exists"
                    })
                    return Response(response)
                else:
                    hotel.save()
                    response = dict({
                        "Message": "Hotel created"
                    })
                    return Response(response, status=status.HTTP_200_OK)