from account.views import UserViews, LoginViews, HotelBookingViews, GetUserViews
from rest_framework.routers import DefaultRouter


router = DefaultRouter()
app_name = 'account'
router.register(r'account/user/create', UserViews, basename='account')
router.register(r'account/user/login', LoginViews, basename='login')
router.register(r'account/user/booking/hotels', HotelBookingViews, basename='hotel')
router.register(r'account/user/get', GetUserViews, basename='get')

urlpatterns = [
    
] + router.urls
