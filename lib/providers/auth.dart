

import 'package:dimofinf/screens/tabs_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Auth extends ChangeNotifier{

  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email,String password, BuildContext context) async {

    try {

      final User user = (await _fireBaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      ))
          .user;
      Toast.show(
        "Welcome ${user.email}"
        ,
        context,
        duration: Toast.LENGTH_LONG,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>TabsScreen()));
      notifyListeners();
    } catch (e) {


      Toast.show(
        "Please Check The email or password"
        ,
        context,
        duration: Toast.LENGTH_LONG,
        backgroundColor: Colors.blueAccent,
        textColor: Colors.white,
      );
      notifyListeners();
    }
  }
}