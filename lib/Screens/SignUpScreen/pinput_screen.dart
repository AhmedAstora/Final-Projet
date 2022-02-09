import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';

class PinputScreen extends StatelessWidget {
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF33907C),
      body: Column(
        children: [
          SizedBox(
            height: 200.h,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Phone Verification',
              style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Enter your OTP code here',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            color: Color(0xFF33907C),
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(20.0),
            child: PinPut(
              eachFieldWidth: 45.w,
              eachFieldHeight: 45.h,
              fieldsCount: 6,
              textStyle: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              //  onSubmit: (String pin) => _showSnackBar(pin, context),
              focusNode: _pinPutFocusNode,
              controller: Provider.of<AuthProvider>(context,listen: false).pinPutController,
              submittedFieldDecoration: _pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(10.0),
              ),
              selectedFieldDecoration: _pinPutDecoration,
              followingFieldDecoration: _pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(2.0),
                border: Border.all(
                  color: Colors.white.withOpacity(.5),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Didn’t you received any code?',
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Resent new code',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          InkWell(
            onTap: () {
              Provider.of<AuthProvider>(context,listen: false).isCorrectCode();

            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: CustomButton(
                title: 'Verify',
                titleColor: Color(0xFF33907C),
                backgroudColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
