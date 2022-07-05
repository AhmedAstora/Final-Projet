import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextfieldProduct extends StatelessWidget {
  String labelText;
  Function validationFun;
  TextEditingController controller;
  TextInputType textInputType;

  CustomTextfieldProduct(
      {this.labelText,
      this.validationFun,
      this.controller,
      this.textInputType = TextInputType.number});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
              width: 121.w,
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              margin: EdgeInsets.symmetric(vertical: 10.h),
              child: TextFormField(
                  maxLength: 3,
                  validator: validationFun,
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  keyboardType: textInputType,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller,
                  decoration: InputDecoration(
                      counterText: '',
                      errorStyle: TextStyle(fontSize: 14.sp),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.sp,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[400]),
                      ),
                      label: Text(labelText))),
            );
  }
}
