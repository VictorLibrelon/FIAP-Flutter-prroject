import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/offer_ride_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carona App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        OfferRideScreen.routeName: (ctx) => OfferRideScreen(),
      },
    );
  }
}
