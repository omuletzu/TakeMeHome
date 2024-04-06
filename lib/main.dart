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
}
