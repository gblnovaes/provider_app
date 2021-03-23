import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/models/user_location.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Container(
      child: Scaffold(
        body: Center(
          child: Text(
              'Location: Lat:${userLocation.latitude}, Long: ${userLocation.longitude}'),
        ),
      ),
    );
  }
}
