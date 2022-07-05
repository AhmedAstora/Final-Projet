import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/MainScreen/mainscreen.dart';
import 'package:finalprojectflutter/Screens/SignUpScreen/signupscreen.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> LoginFormKey = GlobalKey<FormState>();

  LoginValidate() {
    bool isSuccess = LoginFormKey.currentState.validate();
    return isSuccess;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AuthProvider>(
      builder: (cnx, provider, x) {
        return Scaffold(
          backgroundColor: Color(0xFF33907C),
          body: Container(
            margin: EdgeInsets.only(top: 150.h, left: 20.w, right: 20.w),
            child: SingleChildScrollView(
              child: Form(
                key: LoginFormKey,
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
                    CustomTextfieldEmail(
                      controller: provider.loginEmailController,
                      validationFun: provider.emailValidation,
                      labelText: 'Email',
                    ),
                    CustomTextfieldpassword(
                      controller: provider.loginPasswordController,
                      validationFun: provider.nullValidator,
                      labelText: 'Password',
                      textInputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    RoundedLoadingButton(
                      resetAfterDuration: true,
                      resetDuration: Duration(seconds: 1),
                      animateOnTap: provider.Animate,
                      successColor: Colors.white,
                      valueColor: Color(0xFF13B58C),
                      color: Colors.white,
                      child: Text('Login',
                          style: TextStyle(
                              color: Color(0xFF13B58C),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp)),
                      controller: provider.btnController,
                      onPressed: () {
                        if (LoginValidate()) {
                          provider.Animate = true;
                          provider.login(context);

                        }
                      },
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
                                .pushReplaceToSpecificScreenUsingWidget(
                                    '/TypeUserScreen');
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
          ),
        );
      },
    );
  }
}
