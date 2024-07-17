from django.shortcuts import redirect, render

from .forms import ClientForm
from .models import Client


def clients_list(request):
    if request.method == "POST":
        form = ClientForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("clients_list")

    return render(
        request,
        "clients/clients_list.html",
        {
            "form": ClientForm(),
            "clients": Client.objects.all(),
        },
    )
