import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database_read_write {
  Future<List<Map<String, dynamic>>> getData() async {
    // FirebaseFirestore db = FirebaseFirestore.instance;
    // DocumentSnapshot snpSht = await db.collection("wayPointsTEST").doc("LCw2HLZBxI5vYKYeD9Da").get();
    //
    // var map = snpSht.data() as Map<String, dynamic>;

    FirebaseFirestore db = FirebaseFirestore.instance;

    List<Map<String, dynamic>> retmaps = [];

    var ceva = await db.collection("wayPointsTEST").get();
    print(ceva);

    ceva.docs.map((doc) => doc.data()).forEach((map) => retmaps.add(map));

    return retmaps;
  }

  sendData(String xCord, String yCord) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final newEntry = <String, dynamic>{"id": 0, "xCord": xCord, "yCord": yCord};

    db
        .collection("wayPointsTEST")
        .doc()
        .set(newEntry)
        .onError((e, _) => print("Error writing document: $e"));
  }
}
