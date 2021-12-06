import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_db_app/src/model/user_model.dart';
import 'package:movie_db_app/src/ui/home_screen.dart';
import 'package:movie_db_app/src/ui/login_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    UserModel loggedInUser = UserModel();
    if (user != null) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get()
          .then((value) {
        loggedInUser = UserModel.fromMap(value.data());
      });
    }

    return user != null ? HomeScreen() : LoginScreen();
  }
}