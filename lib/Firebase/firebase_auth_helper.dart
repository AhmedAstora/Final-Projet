import 'dart:developer';

import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/SignUpScreen/pinput_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  FirebaseAuthHelper._();

  static FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Snakbar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  CreateNewUser(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Snakbar('The password provided is too weak.', context);
      } else if (e.code == 'email-already-in-use') {
        Snakbar('The account already exists for that email.', context);
      }
    } catch (e) {
      print(e);
    }
  }

  signIn(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Snakbar('user-not-found', context);
      } else if (e.code == '') {
        Snakbar('No user found for that email.', context);
      } else if (e.code == 'wrong-password') {
        print(e.code.toString() + 'Hunter');
        Snakbar('Wrong password provided for that user.', context);
      }
    }
  }

  logout() async {
    await firebaseAuth.signOut();
  }

  forgetPassword(String email) async {
    firebaseAuth.sendPasswordResetEmail(email: email);
  }

  verifyEmail() async {
    firebaseAuth.currentUser.sendEmailVerification();
  }

  registerUsingPhone(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {
        return credential;
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {
        RouterClass.routerClass.pushToSpecificScreenUsingWidget(PinputScreen());
        log(verificationId);
        log(resendToken.toString());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
