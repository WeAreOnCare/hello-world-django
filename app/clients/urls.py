from django.urls import path

from .views import clients_list

urlpatterns = [
    path("", clients_list, name="clients_list"),
]
