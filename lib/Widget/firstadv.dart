import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget FirstAdv() {
  return  Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15.w, top: 15.h, bottom: 15.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black,
                ),
                height: 155.h,
                width: 300.w,
              ),
              Container(
                margin: EdgeInsets.only(left: 35.w, top: 20.h),
                height: 155.h,
                width: 300.w,
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '''READY TO DELIVER TO 
YOUR HOME''',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 8.w, top: 4.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border:
                                Border.all(color: Colors.white, width: 2.w)),
                        child: Text(
                          'START SHOPPING',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp),
                        ))
                  ],
                ),
              ),
            ],
          );
}
