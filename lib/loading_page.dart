import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:take_me_home_auth/main.dart';
import 'package:take_me_home_auth/map.dart';
import 'package:take_me_home_auth/sign_up_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  Future<void> checkUserLoggedIn() async {
    await Future.delayed(Duration(seconds: 1));

    //verificam daca utilizatorul este logat

    var user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Utilizatorul este logat , mergem la pagina principala(harta)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyMapPage()),
      );
    } else {
      // Utilizatorul nu este logat , mergem la sign up page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
