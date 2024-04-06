import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _locationFetched = false;
  final Set<Marker> _markers = {};
  late GoogleMapController _controller;
  LatLng _mainLocation = LatLng(45.759, 21.2197);

  @override
  void initState() {
    super.initState();
    _initMap();
  }

  Future<void> _initMap() async {
    Position position = await _getLocation();
    _mainLocation = LatLng(position.latitude, position.longitude);
    _addMarker();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _locationFetched
            ? GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _mainLocation,
            zoom: 15,
          ),

          myLocationEnabled: true,
          compassEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,

          onTap: (LatLng latLng){
            MarkerId mid = _markers.first.mapsId;
            Marker updated_marker = Marker(
              markerId: mid,
              position:latLng,
              icon: BitmapDescriptor.fromBytes(resizedMarkerImageBytesTemp)
            );
          },

          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
            _controller.setMapStyle('[{"featureType":"all","elementType":"geometry.fill","stylers":[{"weight":"2.00"}]},{"featureType":"all","elementType":"geometry.stroke","stylers":[{"color":"#9c9c9c"}]},{"featureType":"all","elementType":"labels.text","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2f2f2"}]},{"featureType":"landscape","elementType":"geometry.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"landscape.man_made","elementType":"geometry.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"poi","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"all","stylers":[{"saturation":-100},{"lightness":45}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"color":"#eeeeee"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#7b7b7b"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"}]},{"featureType":"road.highway","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"road.arterial","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#46bcec"},{"visibility":"on"}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"color":"#c8d7d4"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#070707"}]},{"featureType":"water","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"}]}]');},
          //markers: _markers,
        )
            : Center(child: CircularProgressIndicator()),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Future<Position> position = _getLocation();
            position.then((value) async{
              _mainLocation = LatLng(value.latitude, value.longitude);
            });

            _controller.animateCamera(CameraUpdate.newLatLngZoom(_mainLocation, 15));
          },
          child: Icon(Icons.location_on),
        ),
      ),
    );
  }

  Future<Position> _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      //_mainLocation = LatLng(position.latitude, position.longitude);
      _locationFetched = true;
    });

    return position;
  }

  void _addMarker() {
    _markers.add(
      Marker(
        markerId: MarkerId(_mainLocation.toString()),
        position: _mainLocation,
        infoWindow: InfoWindow(
          title: 'Historical City',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    setState(() {});
  }
}
