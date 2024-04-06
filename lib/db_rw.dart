import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class db_wr {

  getData() async {
    // FirebaseFirestore db = FirebaseFirestore.instance;
    // DocumentSnapshot snpSht = await db.collection("wayPointsTEST").doc("LCw2HLZBxI5vYKYeD9Da").get();
    //
    // var map = snpSht.data() as Map<String, dynamic>;

    FirebaseFirestore db = FirebaseFirestore.instance;

    var ceva = await db.collection("wayPointsTEST").get();

    print(ceva.docs.map((doc) => doc.data()));
    return (ceva.docs.map((doc) => doc.data()));
  }

  sendData(String xCord, String yCord) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final newEntry = <String, dynamic>{
      "id" : 0,
      "xCord" : xCord,
      "yCord" : yCord
    };

    db
        .collection("wayPointsTEST")
        .doc()
        .set(newEntry)
        .onError((e, _) => print("Error writing document: $e"));
  }

}


