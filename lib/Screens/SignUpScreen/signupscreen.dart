import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/LoginScreen/loginscreen.dart';
import 'package:finalprojectflutter/Screens/MainScreen/mainscreen.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      designSize: Size(393, 851),
      minTextAdapt: true,
      builder: () => Consumer<AuthProvider>(
        builder: (cnx, provider, x) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Color(0xFF33907C),
            body: Container(
              margin: EdgeInsets.only(top: 120.h, left: 20.w, right: 20.w),
              child: SingleChildScrollView(
                child: Form(
                  key: provider.registerFormKey,
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
                        'Signup to your account ',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomTextfield(
                        validationFun: provider.nullValidator,
                        labelText: 'Fisrt Name',
                        controller: provider.firstNameController,
                      ),
                      CustomTextfield(
                        validationFun: provider.nullValidator,
                        labelText: 'Last Name',
                        controller: provider.lastNameController,
                      ),
                      CustomTextfieldEmail(
                        validationFun: provider.emailValidation,
                        labelText: 'Email',
                        controller: provider.emailController,
                      ),
                      CustomTextfieldpassword(
                        validationFun: provider.nullValidator,
                        labelText: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        controller: provider.passwrodController,
                      ),
                      CustomTextfieldpassword(
                        validationFun: provider.nullValidator,
                        labelText: 'Re-enter Password',
                        textInputType: TextInputType.visiblePassword,
                        controller: provider.repasswordController,
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      InkWell(
                        onTap: () {
                         if(provider.registerValidate(context)) {
                           provider.register(context);
                         }
                        },
                        child: CustomButton(
                          title: 'Create',
                          titleColor: Color(0xFF13B58C),
                          backgroudColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an account? ',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontFamily: 'Montserrat'),
                          ),
                          InkWell(
                            onTap: () {
                              RouterClass.routerClass.pushToSpecificScreenUsingWidget(LoginScreen());
                            },
                            child: Text(
                              'Sign in? ',
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
      ),
    );
  }
}
