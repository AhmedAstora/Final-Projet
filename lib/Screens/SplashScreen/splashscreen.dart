import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/LoginScreen/loginscreen.dart';
import 'package:finalprojectflutter/Screens/MainScreen/mainscreen.dart';
import 'package:finalprojectflutter/Screens/PageViewSlider/pageview.dart';
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
      RouterClass.routerClass
          .pushReplaceToSpecificScreenUsingWidget(PageViewr());
    } else
      Provider.of<AuthProvider>(context,listen: false).getUserFromFirebase();
    RouterClass.routerClass
        .pushReplaceToSpecificScreenUsingWidget(MainScreen());
  }

  @override
  void initState() {
    super.initState();
    NavigationFunction(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Scaffold(
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
            )));
  }
}
