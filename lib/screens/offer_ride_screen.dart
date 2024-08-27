import 'package:flutter/material.dart';
import '../models/ride.dart';

class OfferRideScreen extends StatefulWidget {
  static const routeName = '/offer-ride';

  @override
  _OfferRideScreenState createState() => _OfferRideScreenState();
}

class _OfferRideScreenState extends State<OfferRideScreen> {
  final _originController = TextEditingController();
  final _destinationController = TextEditingController();
  final _dateController = TextEditingController();
  final _seatsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oferecer Carona'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _originController,
              decoration: InputDecoration(labelText: 'Origem'),
            ),
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(labelText: 'Destino'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Data'),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    _dateController.text = pickedDate.toLocal().toString().split(' ')[0];
                  });
                }
              },
            ),
            TextField(
              controller: _seatsController,
              decoration: InputDecoration(labelText: 'Número de Vagas'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newRide = Ride(
                  origin: _originController.text,
                  destination: _destinationController.text,
                  date: DateTime.parse(_dateController.text),
                  seats: int.parse(_seatsController.text),
                );
                Navigator.of(context).pop(newRide);
              },
              child: Text('Oferecer Carona'),
            ),
          ],
        ),
      ),
    );
  }
}
