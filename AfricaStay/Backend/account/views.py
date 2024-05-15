# Let's create our views with rest framework

import json
from logging import exception
from rest_framework import viewsets, status
from rest_framework.response import Response
from account.models import User
from rest_framework import request
from .serializers import UserSerializer, UserLoginSerializer, HotelBookingSerializer
from africa_stay.settings import DATABASES
from django.contrib.auth import login, authenticate
from booking.models import Hotel


# user view
class UserViews(viewsets.ViewSet):
    def create(self, request):
        """ Create a new user """
        if request.method == 'POST':
            user = UserSerializer(data=request.data)
            if user.is_valid():
                if User.objects.filter(phone=self.request.data['phone']).exists():
                    response = dict({
                        "Message": "User already exists"
                    })
                    return Response(response)
                else:
                    user.save()
                    response = dict({
                        "Message": "Success"
                    })
                    return Response(response, status=status.HTTP_201_CREATED)
            else:
                response = dict({
                    "Message": "Fail"
                })
                return Response(response, status=status.HTTP_400_BAD_REQUEST)
    
    def update(self, request, pk=None):
        pass

class LoginViews(viewsets.ViewSet):    
    def create(self, request):
        """ Login method """
        if request.method == 'POST':
            user_login = UserLoginSerializer(data=request.data)
            if user_login.is_valid():
                if User.objects.filter(phone=self.request.data['phone']).exists():
                    user = user_login.validated_data['user']
                    try:
                        login(request, user)
                    except:
                        pass
                    response = dict({
                        "Message": "Connected"
                    })
                    return Response(response, status=status.HTTP_200_OK)
                else:
                    response = dict({
                        "Message": "User doesn't exists"
                    })
                    return Response(response, status=status.HTTP_404_NOT_FOUND)
            else:
                response = dict({
                    "Message": "Fail"
                })
                return Response(response, status=status.HTTP_400_BAD_REQUEST)

class LogoutViews(viewsets.ViewSet):   
    def logout(self, request):
        pass


class HotelBooking(viewsets.ViewSet):
    def create(self, request):
        if request.method == 'POST':
            hotel_booking = HotelBookingSerializer(data=request.data)
            if hotel_booking.is_valid():
                if Hotel.objects.filter(hotel_name=self.request.data['hotel_name']).exists():
                    hotel_booking.save()
                    response = dict({
                        "Message": "Success"
                    })
                    return Response(response, status=status.HTTP_201_CREATED)
                else:
                    response = dict({
                        "Message": "Hotel doesn't exists"
                    })
                    return Response(response, status=status.HTTP_404_NOT_FOUND)
            else:
                response = dict({
                    "Message": "Fail"
                })
                return Response(response, status=status.HTTP_400_BAD_REQUEST)