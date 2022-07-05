import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/LoginScreen/loginscreen.dart';
import 'package:finalprojectflutter/Screens/MainScreen/mainscreen.dart';
import 'package:finalprojectflutter/Screens/PageViewSlider/pageview.dart';
import 'package:finalprojectflutter/SharedPreferance/shared_preferance.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatefulWidget {
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  NavigationFunction(context) async {
    await Future.delayed(Duration(milliseconds: 3000));
    if (FirebaseAuth.instance.currentUser == null) {
      if (SpHelper.spHelper.getIsFirstTime()) {
        RouterClass.routerClass
            .pushReplaceToSpecificScreenUsingWidget('/PageViewr');
      } else {
        RouterClass.routerClass
            .pushReplaceToSpecificScreenUsingWidget('/LoginScreen');
      }
    } else {
      Provider.of<AuthProvider>(context, listen: false).getUserFromFirebase();
      Provider.of<AuthProvider>(context, listen: false)
          .getAllUserFromFireBase();
      RouterClass.routerClass
          .pushReplaceToSpecificScreenUsingWidget('/MainScreen');
    }
  }

  @override
  void initState() {
    super.initState();
    NavigationFunction(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF33907C),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
              ),
              Text(
                'Tradly',
                style: TextStyle(
                    fontSize: 30.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ],
          ),
        ));
  }
}
