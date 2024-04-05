import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController myMapController;
  final Set<Marker> _markers = Set(); // Change to Set<Marker>

  static const LatLng _mainLocation =
      LatLng(46.69893, 26.6421); // Removed const

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps With Marker'),
          backgroundColor: Colors.blue[900],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _mainLocation,
                  zoom: 10.0,
                ),
                markers: _markers, // Pass the markers set
                mapType: MapType.normal,
                onMapCreated: (controller) {
                  setState(() {
                    myMapController = controller;
                  });
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:
              _addMarker, // Call _addMarker function when FloatingActionButton is pressed
          tooltip: 'Add Marker',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _addMarker() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_mainLocation.toString()),
        position: _mainLocation,
        infoWindow: InfoWindow(
          title: 'Historical City',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
}
