from account.views import UserViews, LoginViews, HotelBookingViews
from rest_framework.routers import DefaultRouter


router = DefaultRouter()
app_name = 'account'
router.register(r'account/user/create', UserViews, basename='account')
router.register(r'account/user/put', UserViews, basename='update')
router.register(r'account/user/delete', UserViews, basename='delete')
router.register(r'account/user/login', LoginViews, basename='login')
router.register(r'account/user/booking/hotels', HotelBookingViews, basename='hotel')
router.register(r'account/user/booking/get', HotelBookingViews, basename='hotel_book')
router.register(r'account/user/get', UserViews, basename='get')

urlpatterns = [
    
] + router.urls
