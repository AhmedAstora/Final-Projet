import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button.dart';

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Container(
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[400], width: 1),
                  borderRadius: BorderRadius.circular(12.r)),
              width: 160.w,
              height: 200.h,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(11.r),
                        topRight: Radius.circular(11.r)),
                    child: Image.asset(
                      'assets/images/test_photo.png',
                      height: 85.h,
                      width: 160.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                        alignment: Alignment.center,
                        width: 64.w,
                        height: 64.h,
                        decoration: BoxDecoration(
                            color: Color(0xFF33907C),
                            borderRadius: BorderRadius.circular(30.r)),
                        child: Text(
                          'T',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 38.sp),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 80.h),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Tradly Store',
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButtonSeeAll(
                        title: 'Follow',
                        backgroudColor: Color(0xFF33907C),
                        titleColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
