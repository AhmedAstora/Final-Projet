import 'dart:developer';

import 'package:finalprojectflutter/Firebase/firebase_auth_helper.dart';
import 'package:finalprojectflutter/Firebase/firebase_firestore_helper.dart';
import 'package:finalprojectflutter/Models/usermodel.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/LoginScreen/loginscreen.dart';
import 'package:finalprojectflutter/Screens/MainScreen/mainscreen.dart';
import 'package:finalprojectflutter/Screens/SignUpScreen/pinput_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> PhoneFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> LoginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> CreatStoreFormKey = GlobalKey<FormState>();

  TUser loggedUser;
  String value;
  String Code;
  bool TypeUser = false;

  // login controller
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  //phone controller
  TextEditingController PhoneloginPasswordController = TextEditingController();

// register controller
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwrodController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  //create store controller
  TextEditingController namestoreController = TextEditingController();
  TextEditingController webstoreController = TextEditingController();
  TextEditingController DesstoreController = TextEditingController();
  TextEditingController typestoreController = TextEditingController();
  TextEditingController addressstoreController = TextEditingController();
  TextEditingController CitystoreController = TextEditingController();
  TextEditingController statestoreController = TextEditingController();
  TextEditingController courierstoreController = TextEditingController();
  String taglinetoreController;

  // pinput code controller
  TextEditingController pinPutController = TextEditingController();

  isCorrectCode() {
    if (Code == pinPutController.text) {
      RouterClass.routerClass.pushToSpecificScreenUsingWidget(MainScreen());
    }
  }

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

  String phoneValidation(String value) {
    if (!isNumeric(value)) {
      return 'InCorrect Phone syntax';
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

  CreatStoreValidate() {
    bool isSuccess = CreatStoreFormKey.currentState.validate();
    return isSuccess;
  }

  PhoneValidate() {
    bool isSuccess = PhoneFormKey.currentState.validate();
    return isSuccess;
  }

  RegisterPhone() async {
    PhoneAuthCredential credential = await FirebaseAuthHelper.firebaseAuthHelper
        .registerUsingPhone(value + PhoneloginPasswordController.text);
    Code = credential.smsCode;
    log(Code);
    log(credential.smsCode);
  }

  editUser() async {
    TUser tuser = TUser(
        isseller: loggedUser.isseller,
        Fname: loggedUser.Fname,
        Lname: loggedUser.Lname,
        email: loggedUser.email,
        address: addressstoreController.text,
        StoreName: namestoreController.text,
        StoreWebAddress: webstoreController.text,
        StoreDescription: DesstoreController.text,
        StoreType: typestoreController.text,
        StoreCity: CitystoreController.text,
        StoreState: statestoreController.text,
        StoreCourier: courierstoreController.text,
        StoreTagLine: taglinetoreController,
        numfollowers: 0,
        numproducts: 0,
        haveStore: true);
    await FirebaseAuthHelper.firebaseAuthHelper.editUser(tuser);
    await getUserFromFirebase();
    Future.delayed(Duration(seconds: 2))
        .then((value) => {RouterClass.routerClass.popwidget()});
  }

  RemoveStore() async {
    TUser tuser = TUser(
        isseller: loggedUser.isseller,
        Fname: loggedUser.Fname,
        Lname: loggedUser.Lname,
        email: loggedUser.email,
        address: addressstoreController.text,
        StoreName: namestoreController.text,
        StoreWebAddress: webstoreController.text,
        StoreDescription: DesstoreController.text,
        StoreType: typestoreController.text,
        StoreCity: CitystoreController.text,
        StoreState: statestoreController.text,
        StoreCourier: courierstoreController.text,
        StoreTagLine: taglinetoreController,
        haveStore: false);
    await FirebaseAuthHelper.firebaseAuthHelper.editUser(tuser);
    getUserFromFirebase();
  }

  register(BuildContext context) async {
    TUser tuser = TUser(
        isseller: TypeUser,
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
      RouterClass.routerClass.pushToSpecificScreenUsingWidget(MainScreen());
    } on Exception catch (e) {
      // EVERYTHING
    }
  }

  login(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuthHelper.firebaseAuthHelper.signIn(
              loginEmailController.text, loginPasswordController.text, context);
      log(userCredential.user.uid);
      await getUserFromFirebase();
      RouterClass.routerClass.pushToSpecificScreenUsingWidget(MainScreen());
    } on Exception catch (e) {
      // EVERYTHING
    }
  }

  getUserFromFirebase() async {
    if (FirebaseAuth.instance.currentUser != null) {
      String userId = FirebaseAuth.instance.currentUser.uid;
      log(userId);
      this.loggedUser =
          await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
      notifyListeners();
    }
  }

  logOut() async {
    this.loggedUser = null;
    await FirebaseAuthHelper.firebaseAuthHelper.logout();
  }

  forgetPassword(String email) async {
    await FirebaseAuthHelper.firebaseAuthHelper.forgetPassword(email);
  }
}
