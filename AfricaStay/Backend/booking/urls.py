from rest_framework.routers import DefaultRouter
from booking.views import HotelViews, RoomsViews


router = DefaultRouter()
app_name = 'booking'
router.register(r'booking/create/rooms', RoomsViews, basename='rooms')
router.register(r'booking/create/hotel', HotelViews, basename='booking')

urlpatterns = [
    
] + router.urls
