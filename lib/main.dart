<<<<<<< HEAD
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _locationFetched = false;
  final Set<Marker> _markers = {};
  late GoogleMapController _controller;
  LatLng _mainLocation = LatLng(45.809, 21.2197);

  var dangers_list = ['item1', 'item2'];
  String dropDownItem = 'item1';

  Set<Circle> _cirle = HashSet<Circle>();

  @override
  void initState() {
    super.initState();
    _initMap();
  }

  Future<void> _initMap() async {
    Position position = await _getLocation();
    _mainLocation = LatLng(position.latitude, position.longitude);
    _addCircle(_mainLocation);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return _locationFetched
                ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _mainLocation,
                zoom: 15,
              ),

              myLocationEnabled: true,
              compassEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              markers: _markers,
              circles: _cirle,

              onTap: (LatLng latLng) {
                _addMarker(latLng);
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    title: Text('Alege pericolul',
                      textAlign: TextAlign.center),

                    content: Container(
                      height: 250,
                      padding: EdgeInsets.all(0),
                      child:
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(                                         // pericol animale
                                  children: [
                                    SizedBox.fromSize(
                                      size: const Size(80, 80), // button width and height
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color.fromRGBO(237, 76, 111, 1), // button color
                                          child: InkWell(
                                            splashColor: Colors.green, // splash color
                                            onTap: () {



                                              Navigator.of(context).pop();
                                            }, // button pressed
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(Icons.people,
                                                    color: Colors.white), // icon
                                                Text("Comunitar", style: TextStyle(color: Colors.white)),
                                                // text
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),

                                Column(                                         // pericol animale
                                  children: [
                                    SizedBox.fromSize(
                                      size: const Size(80, 80), // button width and height
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color.fromRGBO(237, 76, 111, 1), // button color
                                          child: InkWell(
                                            splashColor: Colors.green, // splash color
                                            onTap: () {



                                              Navigator.of(context).pop();
                                            }, // button pressed
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(FontAwesomeIcons.dog,
                                                    color: Colors.white), // icon
                                                Text("Animale", style: TextStyle(color: Colors.white)), // text
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),

                                Column(                                         // pericol animale
                                  children: [
                                    SizedBox.fromSize(
                                      size: const Size(80, 80),  // button width and height
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color.fromRGBO(237, 76, 111, 1), // button color
                                          child: InkWell(
                                            splashColor: Colors.green, // splash color
                                            onTap: () {



                                              Navigator.of(context).pop();
                                            }, // button pressed
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(Icons.fireplace,
                                                    color: Colors.white), // icon
                                                Text("Incendiu", style: TextStyle(color: Colors.white)), // text
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),

                            const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),

                            Row(
                              children: [
                                Column(                                         // pericol animale
                                  children: [
                                    SizedBox.fromSize(
                                      size: const Size(80, 80),  // button width and height
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color.fromRGBO(237, 76, 111, 1), // button color
                                          child: InkWell(
                                            splashColor: Colors.green, // splash color
                                            onTap: () {



                                              Navigator.of(context).pop();
                                            }, // button pressed
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(Icons.car_crash,
                                                    color: Colors.white), // icon
                                                Text("Rutier", style: TextStyle(color: Colors.white)), // text
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),

                                Column(                                         // pericol animale
                                  children: [
                                    SizedBox.fromSize(
                                      size: const Size(80, 80),  // button width and height
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color.fromRGBO(237, 76, 111, 1), // button color
                                          child: InkWell(
                                            splashColor: Colors.green, // splash color
                                            onTap: () {



                                              Navigator.of(context).pop();
                                            }, // button pressed
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(FontAwesomeIcons.wallet,
                                                    color: Colors.white), // icon
                                                Text("Inselatorie", style: TextStyle(color: Colors.white)), // text
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                const Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),

                                Column(                                         // pericol animale
                                  children: [
                                    SizedBox.fromSize(
                                      size: const Size(80, 80), // button width and height
                                      child: ClipOval(
                                        child: Material(
                                          color: const Color.fromRGBO(237, 76, 111, 1), // button color
                                          child: InkWell(
                                            splashColor: Colors.green, // splash color
                                            onTap: () {



                                              Navigator.of(context).pop();
                                            }, // button pressed
                                            child: const Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(FontAwesomeIcons.fistRaised,
                                                  color: Colors.white),
                                                // icon
                                                Text("Violenta", style: TextStyle(color: Colors.white)), // text
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                    ),
                  );
                });
                // showPopover(
                //   context: context,
                //   bodyBuilder: (context) => const MenuPin(),
                //   width: 250,
                //   height: 250,
                // );
              },

              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                _controller.setMapStyle('[{"featureType":"all","elementType":"geometry.fill","stylers":[{"weight":"2.00"}]},{"featureType":"all","elementType":"geometry.stroke","stylers":[{"color":"#9c9c9c"}]},{"featureType":"all","elementType":"labels.text","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2f2f2"}]},{"featureType":"landscape","elementType":"geometry.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"landscape.man_made","elementType":"geometry.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"poi","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"all","stylers":[{"saturation":-100},{"lightness":45}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"color":"#eeeeee"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#7b7b7b"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"}]},{"featureType":"road.highway","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"road.arterial","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#46bcec"},{"visibility":"on"}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"color":"#c8d7d4"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#070707"}]},{"featureType":"water","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"}]}]');},
            )
                : const Center(child: CircularProgressIndicator());

          },
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(237, 76, 111, 1),
          onPressed: (){
            Future<Position> position = _getLocation();
            position.then((value) async{
              _mainLocation = LatLng(value.latitude, value.longitude);
            });

            _controller.animateCamera(CameraUpdate.newLatLngZoom(_mainLocation, 15));
          },
          child: const Icon(Icons.location_on,
                      color: Colors.white),
        ),
      ),
    );
  }

  Future<Position> _getLocation() async {
    Position position =
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _locationFetched = true;
    });
    return position;
  }

  void _addCircle(LatLng latLng){
    String circle_id = "CircleId ${latLng.latitude} - ${latLng.longitude}";

    Circle circle_new = Circle(
      circleId: CircleId(circle_id),
      center: latLng,
      radius: 75.0,
      fillColor: Colors.redAccent.withOpacity(0.5)
    );

    _cirle.add(circle_new);
  }

  void _addMarker(LatLng _location) {
    Marker marker = Marker(
      markerId: MarkerId(_location.toString()),
      position: _location,
      infoWindow: InfoWindow(
        title: 'Historical City',
        snippet: '5 Star Rating',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose)
    );

    setState(() {
      _markers.clear();
      _markers.add(marker);
    });
  }
=======
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:take_me_home_auth/firebase_options.dart';
import 'package:take_me_home_auth/sign_up_page.dart';
import 'package:take_me_home_auth/splash_screen_test.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
>>>>>>> a17c959 (firebase update corrected)
}
