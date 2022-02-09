import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/LoginScreen/loginscreen.dart';
import 'package:finalprojectflutter/Screens/SignUpScreen/signupscreen.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TypeUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AuthProvider>(
      builder: (cnx, provider, x) {
        return Scaffold(
          backgroundColor: Color(0xFF33907C),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    provider.TypeUser = true;
                    RouterClass.routerClass
                        .pushReplaceToSpecificScreenUsingWidget(SignUpScreen());
                  },
                  child: Container(
                    width: 150.w,
                    child: CustomButton(
                      title: 'Seller',
                      backgroudColor: Colors.white,
                      titleColor: Color(0xFF33907C),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    provider.TypeUser = false;
                    RouterClass.routerClass
                        .pushReplaceToSpecificScreenUsingWidget(SignUpScreen());
                  },
                  child: Container(
                    width: 150.w,
                    child: CustomButton(
                      title: 'Customer',
                      backgroudColor: Colors.white,
                      titleColor: Color(0xFF33907C),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
