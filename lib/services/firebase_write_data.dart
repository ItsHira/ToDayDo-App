import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fi_as3_hira/services/firebase_read_data.dart';
import 'package:flutter/material.dart';

class Write {
  final CollectionReference _usersCollection = FirebaseFirestore.instance
      .collection('data')
      .doc(UserProvider.uid)
      .collection('todo');
  void addData(String name, bool check, String imageUrl) async {
    try {
      await _usersCollection.add(
        {
          'work': name,
          'bool': check,
          'image': imageUrl,
        },
      );
      debugPrint('Data stored');
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
