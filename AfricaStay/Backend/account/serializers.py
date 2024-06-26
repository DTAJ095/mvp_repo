from rest_framework import serializers
from .models import User, HotelBook
from django.contrib.auth import authenticate

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields=['first_name', 'last_name', 'phone', 'password']

class UserLoginSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields=['phone', 'password']
        
    def validate(self, data):
        phone = data.get('phone', None)
        password = data.get('password', None)
        if phone and password:
            user = authenticate(phone=phone, password=password)
            if user:
                data['user'] = user
            data['user'] = user
        return data

class GetUserDataSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields=['first_name', 'last_name', 'phone']
        

class HotelBookSerializer(serializers.ModelSerializer):
    class Meta:
        model=HotelBook
        fields=['book_id', 'client_name', 'phone', 'hotel_name', 'room', 'check_in', 'check_out', 'created_date']