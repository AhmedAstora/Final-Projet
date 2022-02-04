import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/SignUpScreen/signupscreen.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Scaffold(
              backgroundColor: Color(0xFF33907C),
              body: Container(
                margin: EdgeInsets.only(top: 150.h, left: 20.w, right: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Welcome to tradly',
                        style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        'Login to your account ',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomTextfield(
                        labelText: 'Email',
                      ),
                      CustomTextfieldpassword(
                        labelText: 'Password',
                        textInputType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      CustomButton(
                        title: 'Login',
                        titleColor: Color(0xFF13B58C),
                        backgroudColor: Colors.white,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Forgot your password ? ',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(
                        height: 45.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontFamily: 'Montserrat'),
                          ),
                          InkWell(
                            onTap: () {
                              RouterClass.routerClass
                                  .pushToSpecificScreenUsingWidget(
                                      SignUpScreen());

                            },
                            child: Text(
                              'Sign up? ',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
