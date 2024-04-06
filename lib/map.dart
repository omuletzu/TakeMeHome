import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:take_me_home_auth/global/common/toast.dart';
import 'package:take_me_home_auth/loading_page.dart';

class MyMapPage extends StatefulWidget {
  @override
  _MyMapPageState createState() => _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
    await _fetchLocationsFromFirestore();
  }

  Future<void> _fetchLocationsFromFirestore() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('waypoints').get();
    querySnapshot.docs.forEach((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      double latitude = data['latitude'];
      double longitude = data['longitude'];
      LatLng location = LatLng(latitude, longitude);
      _addCircle(location);
    });
    setState(() {
      _locationFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                _locationFetched
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
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Alege pericolul\n',
                                      textAlign: TextAlign.center),
                                  content: Container(
                                      height: screenSize.height * 0.15,
                                      padding: EdgeInsets.all(0),
                                      child: Column(
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                Column(
                                                  // pericol animale
                                                  children: [
                                                    SizedBox.fromSize(
                                                      size: const Size(80,
                                                          80), // button width and height
                                                      child: ClipOval(
                                                        child: Material(
                                                          color: const Color
                                                              .fromRGBO(
                                                              237,
                                                              76,
                                                              111,
                                                              1), // button color
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .green, // splash color
                                                            onTap: () {
                                                              _addMarker(latLng,
                                                                  "Comunitar");
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }, // button pressed
                                                            child: const Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <Widget>[
                                                                Icon(
                                                                    Icons
                                                                        .people,
                                                                    color: Colors
                                                                        .white), // icon
                                                                Text(
                                                                    "Comunitar",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white)),
                                                                // text
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.0)),
                                                Column(
                                                  // pericol animale
                                                  children: [
                                                    SizedBox.fromSize(
                                                      size: const Size(80,
                                                          80), // button width and height
                                                      child: ClipOval(
                                                        child: Material(
                                                          color: const Color
                                                              .fromRGBO(
                                                              237,
                                                              76,
                                                              111,
                                                              1), // button color
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .green, // splash color
                                                            onTap: () {
                                                              _addMarker(latLng,
                                                                  "Animale");
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }, // button pressed
                                                            child: const Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <Widget>[
                                                                Icon(
                                                                    FontAwesomeIcons
                                                                        .dog,
                                                                    color: Colors
                                                                        .white), // icon
                                                                Text("Animale",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white)), // text
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.0)),
                                                Column(
                                                  // pericol animale
                                                  children: [
                                                    SizedBox.fromSize(
                                                      size: const Size(80,
                                                          80), // button width and height
                                                      child: ClipOval(
                                                        child: Material(
                                                          color: const Color
                                                              .fromRGBO(
                                                              237,
                                                              76,
                                                              111,
                                                              1), // button color
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .green, // splash color
                                                            onTap: () {
                                                              _addMarker(latLng,
                                                                  "Incendiu");
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }, // button pressed
                                                            child: const Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <Widget>[
                                                                Icon(
                                                                    Icons
                                                                        .fireplace,
                                                                    color: Colors
                                                                        .white), // icon
                                                                Text("Incendiu",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white)), // text
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  // pericol animale
                                                  children: [
                                                    SizedBox.fromSize(
                                                      size: const Size(80,
                                                          80), // button width and height
                                                      child: ClipOval(
                                                        child: Material(
                                                          color: const Color
                                                              .fromRGBO(
                                                              237,
                                                              76,
                                                              111,
                                                              1), // button color
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .green, // splash color
                                                            onTap: () {
                                                              _addMarker(latLng,
                                                                  "Rutier");
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }, // button pressed
                                                            child: const Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <Widget>[
                                                                Icon(
                                                                    Icons
                                                                        .car_crash,
                                                                    color: Colors
                                                                        .white), // icon
                                                                Text("Rutier",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white)), // text
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.0)),
                                                Column(
                                                  // pericol animale
                                                  children: [
                                                    SizedBox.fromSize(
                                                      size: const Size(80,
                                                          80), // button width and height
                                                      child: ClipOval(
                                                        child: Material(
                                                          color: const Color
                                                              .fromRGBO(
                                                              237,
                                                              76,
                                                              111,
                                                              1), // button color
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .green, // splash color
                                                            onTap: () {
                                                              _addMarker(latLng,
                                                                  "Inselatorie");
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }, // button pressed
                                                            child: const Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <Widget>[
                                                                Icon(
                                                                    FontAwesomeIcons
                                                                        .wallet,
                                                                    color: Colors
                                                                        .white), // icon
                                                                Text(
                                                                    "Inselatorie",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white)), // text
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.0)),
                                                Column(
                                                  // pericol animale
                                                  children: [
                                                    SizedBox.fromSize(
                                                      size: const Size(80,
                                                          80), // button width and height
                                                      child: ClipOval(
                                                        child: Material(
                                                          color: const Color
                                                              .fromRGBO(
                                                              237,
                                                              76,
                                                              111,
                                                              1), // button color
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .green, // splash color
                                                            onTap: () {
                                                              _addMarker(latLng,
                                                                  "Violenta");
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }, // button pressed
                                                            child: const Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: <Widget>[
                                                                Icon(
                                                                    FontAwesomeIcons
                                                                        .fistRaised,
                                                                    color: Colors
                                                                        .white),
                                                                // icon
                                                                Text("Violenta",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white)), // text
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
                                          ),
                                        ],
                                      )),
                                );
                              });
                        },
                        onMapCreated: (GoogleMapController controller) {
                          _controller = controller;
                          _controller.setMapStyle(
                              '[{"featureType":"all","elementType":"geometry.fill","stylers":[{"weight":"2.00"}]},{"featureType":"all","elementType":"geometry.stroke","stylers":[{"color":"#9c9c9c"}]},{"featureType":"all","elementType":"labels.text","stylers":[{"visibility":"on"}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2f2f2"}]},{"featureType":"landscape","elementType":"geometry.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"landscape.man_made","elementType":"geometry.fill","stylers":[{"color":"#ffffff"}]},{"featureType":"poi","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"all","stylers":[{"saturation":-100},{"lightness":45}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"color":"#eeeeee"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#7b7b7b"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"}]},{"featureType":"road.highway","elementType":"all","stylers":[{"visibility":"simplified"}]},{"featureType":"road.arterial","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#46bcec"},{"visibility":"on"}]},{"featureType":"water","elementType":"geometry.fill","stylers":[{"color":"#c8d7d4"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#070707"}]},{"featureType":"water","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"}]}]');
                        },
                      )
                    : const Center(child: CircularProgressIndicator()),
                Positioned(
                  top: screenSize.height * 0.1,
                  left: screenSize.width * 0.05,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color.fromRGBO(237, 76, 111, 1),
                    ),
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Setari'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    _signOut(context);
                                  },
                                  child: Text('Log out'),
                                )
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(237, 76, 111, 1),
          onPressed: () {
            Future<Position> position = _getLocation();
            position.then((value) async {
              _mainLocation = LatLng(value.latitude, value.longitude);
            });

            _controller
                .animateCamera(CameraUpdate.newLatLngZoom(_mainLocation, 15));
          },
          child: const Icon(Icons.location_on, color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoadingScreen()),
      (route) => false,
    );
    showToast(message: "Successfully Signed Out");
  }

  Future<Position> _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _locationFetched = true;
    });
    return position;
  }

  void _addCircle(LatLng latLng) {
    String circle_id = "CircleId ${latLng.latitude} - ${latLng.longitude}";

    _cirle.add(Circle(
        circleId: CircleId(circle_id),
        center: latLng,
        radius: 75.0,
        fillColor: Colors.redAccent.withOpacity(0.5),
        strokeColor: Colors.transparent));
  }

  void _addMarker(
    LatLng location,
    String tip_pericol,
  ) {
    Marker marker = Marker(
      markerId: MarkerId(location.toString()),
      position: location,
      infoWindow: InfoWindow(
        title: "Pericol Raportat",
        snippet: tip_pericol,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    );

    // Adaugam marker
    setState(() {
      _markers.clear();
      _markers.add(marker);
    });

    // adaugam coordonatele la baza de date
    _addCircle(LatLng(location.latitude, location.longitude));
    _addCoordinatesToFirestore(
        location.latitude, location.longitude, tip_pericol);
  }

  // functie care adauga coordonate , data crearii si tipul pericolului
  void _addCoordinatesToFirestore(
      double latitude, double longitude, String tip_pericol) {
    DateTime currentTime = DateTime.now();

    _firestore.collection('waypoints').add({
      'latitude': latitude,
      'longitude': longitude,
      'creation_date': currentTime,
      'tip_pericol': tip_pericol
    }).then((_) {
      print('Coordinates added to Firestore successfully!');
    }).catchError((error) {
      print('Failed to add coordinates to Firestore: $error');
    });
  }
}
