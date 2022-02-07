import 'dart:developer';

import 'package:finalprojectflutter/Firebase/firebase_auth_helper.dart';
import 'package:finalprojectflutter/Firebase/firebase_firestore_helper.dart';
import 'package:finalprojectflutter/Models/usermodel.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/LoginScreen/loginscreen.dart';
import 'package:finalprojectflutter/Screens/MainScreen/mainscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> LoginFormKey = GlobalKey<FormState>();

  TUser loggedUser;
  // login controller
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();


// register controller
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwrodController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  String nullValidator(String value) {
    if (value.isEmpty) {
      return 'Required Field';
    }
    return null;
  }


 String emailValidation(String value) {
    if (!isEmail(value)) {
      return 'InCorrect Email syntax';
    }
  }

  Snakbar(String message, BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  registerValidate(BuildContext context) {
    bool isSuccess = registerFormKey.currentState.validate();
    if (passwrodController.text == repasswordController.text) {
      return isSuccess;
    } else {
      Snakbar('Password dosent match', context);
    }
  }
  LoginValidate() {
    bool isSuccess = LoginFormKey.currentState.validate();
    return isSuccess;
  }

  register(BuildContext context) async {
    TUser tuser = TUser(
        Fname: firstNameController.text,
        Lname: lastNameController.text,
        email: emailController.text,
        password: passwrodController.text);
    try {
      String userId = await FirebaseAuthHelper.firebaseAuthHelper
          .CreateNewUser(tuser.email, tuser.password, context);
      log(userId);
      tuser.id = userId;
      await FirestoreHelper.firestoreHelper.createUserInFs(tuser);
      this.loggedUser = tuser;
      RouterClass.routerClass
          .pushToSpecificScreenUsingWidget(MainScreen());
    } on Exception catch (e) {
      // EVERYTHING
    }
  }

  login(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuthHelper.firebaseAuthHelper.signIn(loginEmailController.text, loginPasswordController.text,context);
      await getUserFromFirebase();
      RouterClass.routerClass
          .pushToSpecificScreenUsingWidget(MainScreen());
    } on Exception catch (e) {
      // EVERYTHING
    }
  }

  getUserFromFirebase() async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    this.loggedUser =
        await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
    notifyListeners();
  }

  logOut() async {
    this.loggedUser = null;
    await FirebaseAuthHelper.firebaseAuthHelper.logout();
    RouterClass.routerClass
        .pushReplaceToSpecificScreenUsingWidget(LoginScreen());
  }
}
