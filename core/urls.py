from django.urls import path
# from .views import get_messages
from .views import get_messages, health_check



urlpatterns = [
    path('messages/', get_messages),
    path('health/', health_check),
]
