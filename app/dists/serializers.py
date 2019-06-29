from rest_framework import serializers
from .models import Distribution

class DistributionSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Distribution
        fields = ('url','id', 'name')