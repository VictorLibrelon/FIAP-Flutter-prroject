import 'package:flutter/material.dart';
import '../models/ride.dart';
import 'offer_ride_screen.dart';
import 'search_ride_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Ride> offeredRides = [];
  List<Ride> reservedRides = [];

  void _addOfferedRide(Ride newRide) {
    setState(() {
      offeredRides.add(newRide);
    });
  }

  void _reserveRide(Ride ride) {
    setState(() {
      reservedRides.add(ride);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carona App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Bem-vindo, Usuário!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Caronas Oferecidas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: offeredRides.length,
                    itemBuilder: (ctx, index) {
                      final ride = offeredRides[index];
                      return ListTile(
                        title: Text('${ride.origin} -> ${ride.destination}'),
                        subtitle: Text('Data: ${ride.date.toLocal().toString().split(' ')[0]}'),
                      );
                    },
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Caronas Reservadas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  subtitle: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: reservedRides.length,
                    itemBuilder: (ctx, index) {
                      final ride = reservedRides[index];
                      return ListTile(
                        title: Text('${ride.origin} -> ${ride.destination}'),
                        subtitle: Text('Data: ${ride.date.toLocal().toString().split(' ')[0]}'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final newRide = await Navigator.of(context).push<Ride>(
                    MaterialPageRoute(
                      builder: (context) => OfferRideScreen(),
                    ),
                  );
                  if (newRide != null) {
                    _addOfferedRide(newRide);
                  }
                },
                child: Text('Oferecer Carona'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchRideScreen(
                        offeredRides: offeredRides,
                        onReserveRide: _reserveRide,
                      ),
                    ),
                  );
                },
                child: Text('Procurar Carona'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
