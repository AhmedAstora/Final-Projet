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
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
          validator: validationFun,
          style: TextStyle(color: Colors.white),
          keyboardType: textInputType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 14.sp),
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              hintText: labelText,
              hintStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)))),
    );
  }
}

class CustomTextfieldEmail extends StatelessWidget {
  String labelText;
  Function validationFun;
  TextEditingController controller;
  TextInputType textInputType;

  CustomTextfieldEmail(
      {this.labelText,
      this.validationFun,
      this.controller,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
          controller: controller,
          validator: validationFun,
          style: TextStyle(color: Colors.white),
          keyboardType: textInputType,
          decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 14.sp),
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              hintText: labelText,
              hintStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)))),
    );
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
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
          validator: validationFun,
          style: TextStyle(color: Colors.white),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: textInputType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 14.sp),
              labelStyle: TextStyle(color: Colors.white),
              hintText: labelText,
              hintStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)))),
    );
  }
}

class SearchTextfield extends StatelessWidget with PreferredSizeWidget {
  String labelText;
  Function validationFun;
  Function onChangeFun;
  TextEditingController controller;
  TextInputType textInputType;

  SearchTextfield(
      {this.labelText,
      this.validationFun,
      this.onChangeFun,
      this.controller,
      this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      child: TextFormField(
          autofocus: true,
          onChanged: onChangeFun,
          style: TextStyle(color: Colors.grey[700]),
          keyboardType: textInputType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 14.sp),
              prefixIcon: Image.asset(
                'assets/images/search.png',
                color: Color(0xFF33907C),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: labelText,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)))),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
