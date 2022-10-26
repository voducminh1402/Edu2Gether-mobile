import 'dart:async';

import 'package:edu2gether_mobile/models/mentee.dart';
import 'package:edu2gether_mobile/screens/login/login.dart';
import 'package:edu2gether_mobile/screens/my_course/my_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';

class AuthService{
  final auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      checkUserState();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  createUserWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // final user = credential.user;
      // Mentee mentee = Mentee(id: user!.uid);
      // createMentee(mentee);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
    checkUserState();
  }

  checkUserState(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        Get.to(() => Login());
      } else {
        print('User is signed in!');
        user.getIdToken().then((resutl)
        { print(resutl);});
        Get.to(() => MyHomePage());
      }
    });
  }

  Future<List<Mentee>?> getMentees() async {
    try {
      var url = Uri.parse("http://54.255.199.121/api/v1" + "/mentees");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Mentee> _model = menteeFromJson(response.body);
        return _model;
      }
    } catch (e) {
      print(e.toString());
      log(e.toString());
    }
  }
  Future<Mentee?> createMentee(mentee) async {
    try{
      var response = await http.post(Uri.parse("http://54.255.199.121/api/v1" + "/mentees"),
          body: jsonEncode(mentee)
      );
      if (response.statusCode == 200) {
        Mentee _model = Mentee.fromJson(response.body as Map<String, dynamic>);
        return _model;
      }
    } catch(e){
      rethrow;
    }
  }
}