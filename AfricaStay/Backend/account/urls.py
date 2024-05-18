from account.views import UserViews, LoginViews, HotelBookingViews
from rest_framework.routers import DefaultRouter


router = DefaultRouter()
app_name = 'account'
router.register(r'account/user/create', UserViews, basename='account')
router.register(r'account/user/login', LoginViews, basename='login')
router.register(r'account/user/booking/hotels', HotelBookingViews, basename='hotel')

urlpatterns = [
    
] + router.urls
