import 'dart:async';

import 'package:location/location.dart';
import 'package:provider_app/models/user_location.dart';

class LocationService {
  UserLocation _currentLocation;

  var location = Location();

  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();

  LocationService() {
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.GRANTED) {
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _locationController.add(
              UserLocation(locationData.latitude, locationData.longitude),
            );
          }
        });
      }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation =
          UserLocation(userLocation.latitude, userLocation.longitude);
    } catch (e) {
      print("Nao foi possivel obter localizacao. ${e.toString()}");
    }

    return _currentLocation;
  }
}
