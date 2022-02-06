import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Container(
              margin: EdgeInsets.only(top: 6.h),
              color: Colors.white,
              height: 86.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      width: 48.w,
                      height: 48.h,
                      image: AssetImage('assets/images/image.png'),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        'Coca Cola',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\$25',
                            style: TextStyle(
                                color: Color(0xFF33907C),
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '\$50',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '50% off',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.sp),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  CustomButtonorderConfirmed(
                    title: 'Payment confirmed',
                    backgroudColor: Colors.white,
                    titleColor: Color(0xFF33907C),
                  ),
                ],
              ),
            ));
  }
}
