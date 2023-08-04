import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fi_as3_hira/constants/f1_as3_hira_static.dart';
import 'package:flutter/material.dart';

class UserProvider {
  static final _firestore = FirebaseFirestore.instance;
  static const userCollection = ServicesConstants.usersCollection;
  static String uid = '';

  final users = _firestore.collection(userCollection).doc(uid).get();


  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
    try {
      return _firestore
          .collection(userCollection)
          .doc(uid)
          .collection('todo')
          .snapshots()
          .asBroadcastStream();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
