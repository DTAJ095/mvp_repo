# Let's create our views with rest framework

import json
from logging import exception
from rest_framework import viewsets, status
from rest_framework.response import Response
from account.models import User, HotelBook
from rest_framework import request
from .serializers import UserSerializer, UserLoginSerializer
from africa_stay.settings import DATABASES
from django.contrib.auth import login, authenticate
from booking.models import Hotel, RoomsAvailable
from datetime import datetime, timedelta


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


class HotelBookingViews(viewsets.ViewSet):
    def create(self, request):
        """ Book a hotel """
        check_in = datetime.strptime(self.request.data['check_in'], '%d-%m-%Y')
        check_out = datetime.strptime(self.request.data['check_out'], '%d-%m-%Y')
        now = datetime.now() + timedelta(hours=1)
        created_date = now.strftime('%d-%m-%Y, %h-%m-%s')
        if request.method == 'POST':
            hotel_book = HotelBook(
                client_name=self.request.data['client_name'],
                phone=self.request.data['phone'],
                hotel_name=self.request.data['hotel_name'],
                room=self.request.data['room'],
                check_in=check_in,
                check_out=check_out,
                created_date=created_date
            )
            if Hotel.objects.filter(hotel_name=self.request.data['hotel_name']).exists():
                if RoomsAvailable.objects.filter(rooms_type=self.request.data['room']).exists():
                    if check_in > now and check_out > check_in:
                        if HotelBook.objects.filter(hotel_name=self.request.data['hotel_name'],
                                                    room=self.request.data['room'],
                                                    check_in=check_in,
                                                    check_out=check_out).exists():
                            response = dict({
                                "Message": "Booking already exists"
                            })
                            return Response(response)
                        else:
                            hotel_book.save()
                            response = dict({
                                "Message": "Booking created"
                            })
                            return Response(response, status=status.HTTP_200_OK)
                    else:
                        response = dict({
                            "Message": "Check in or check out date is invalid"
                        })
                        return Response(response, status=status.HTTP_400_BAD_REQUEST)
                else:
                    response = dict({
                        "Message": "Room is not available"
                    })
                    return Response(response, status=status.HTTP_404_NOT_FOUND)
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
    
