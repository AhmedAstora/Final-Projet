import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfieldAddress extends StatelessWidget {
  String labelText;
  Function validationFun;
  TextEditingController controller;
  TextInputType textInputType;

  CustomTextfieldAddress({this.labelText,
    this.validationFun,
    this.controller,
    this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () =>
            Container(
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: TextFormField(


                  style: TextStyle(color: Colors.black,fontSize:16.sp),
                  keyboardType: textInputType,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller,

                  decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 14.sp),
                      labelStyle: TextStyle(
                        color: Colors.grey,fontSize: 14.sp,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      label: Text(labelText))),
            ));
  }
}
