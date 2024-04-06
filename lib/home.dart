import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:take_me_home_auth/db_rw.dart';
import 'package:take_me_home_auth/firebase_options.dart';
import 'package:take_me_home_auth/sign_up_page.dart';

String retstr = "null";

tst() async{
  var ret = await db_wr().getData();
  String retStr = "";
  ret((item) => {
    retStr += item.toString()
  });
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                tst();
              },
              child: Text("read"),
            ),
            Text(retstr),
            ElevatedButton(
              onPressed: () {
                db_wr().sendData("1", "2");
              },
              child: Text("write"),
            ),
            TextField( ),
          ],
        ),
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
    home: HomePage(),
  ));
}