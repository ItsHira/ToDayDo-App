import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Write {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('data');
  void addData(String name,bool check) async {
    try {
      await _usersCollection.add(
        {
          'work': name,
          'bool': check,
        },
      );
      debugPrint('Data stored');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
