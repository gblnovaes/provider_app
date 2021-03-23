import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/views/home_view.dart';

import 'models/user_location.dart';
import 'services/location_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
        create: (context) => LocationService().locationStream,
        child: MaterialApp(home: HomeView()));
  }
}
