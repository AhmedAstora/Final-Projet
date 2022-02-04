import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfield extends StatelessWidget {
  String labelText;
  Function validationFun;
  TextEditingController controller;
  TextInputType textInputType;

  CustomTextfield(
      {this.labelText,
      this.validationFun,
      this.controller,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Container(
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: textInputType,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white,),
                      hintText: labelText,
                      hintStyle: TextStyle(color: Colors.white,fontSize: 14.sp),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white)))),
            ));
  }
}

class CustomTextfieldpassword extends StatelessWidget {
  String labelText;
  Function validationFun;
  TextEditingController controller;
  TextInputType textInputType;

  CustomTextfieldpassword(
      {this.labelText,
      this.validationFun,
      this.controller,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Container(
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: textInputType,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: labelText,
                      hintStyle: TextStyle(color: Colors.white,fontSize: 14.sp),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white)))),
            ));
  }
}

class SearchTextfield extends StatelessWidget with PreferredSizeWidget{
  String labelText;
  Function validationFun;
  TextEditingController controller;
  TextInputType textInputType;

  SearchTextfield(
      {this.labelText,
      this.validationFun,
      this.controller,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Container(
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              child: TextFormField(
                  style: TextStyle(color: Colors.grey[700]),
                  keyboardType: textInputType,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller,
                  decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/images/search.png',color: Color(0xFF33907C),),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: labelText,
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 14.sp),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white)))),
            ));
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
