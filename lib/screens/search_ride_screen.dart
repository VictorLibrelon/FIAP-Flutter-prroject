import 'package:flutter/material.dart';
import '../models/ride.dart';

class SearchRideScreen extends StatefulWidget {
  final List<Ride> offeredRides;
  final Function(Ride) onReserveRide;

  SearchRideScreen({
    required this.offeredRides,
    required this.onReserveRide,
  });

  @override
  _SearchRideScreenState createState() => _SearchRideScreenState();
}

class _SearchRideScreenState extends State<SearchRideScreen> {
  late List<Ride> filteredRides;

  @override
  void initState() {
    super.initState();
    filteredRides = widget.offeredRides;
  }

  @override
  Widget build(BuildContext context) {
    final _originController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Procurar Carona'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _originController,
              decoration: InputDecoration(labelText: 'Origem'),
              onChanged: (value) {
                setState(() {
                  filteredRides = widget.offeredRides.where((ride) => ride.origin.contains(value)).toList();
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredRides.length,
                itemBuilder: (ctx, index) {
                  final ride = filteredRides[index];
                  return ListTile(
                    title: Text('${ride.origin} -> ${ride.destination}'),
                    subtitle: Text('Data: ${ride.date.toLocal().toString().split(' ')[0]}'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        widget.onReserveRide(ride);
                        Navigator.of(context).pop();
                      },
                      child: Text('Reservar'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
