from django.shortcuts import render
from rest_framework import viewsets
from .models import Distribution
from .serializers import DistributionSerializer

class DistributionView(viewsets.ModelViewSet):
    queryset = Distribution.objects.all()
    serializer_class = DistributionSerializer
