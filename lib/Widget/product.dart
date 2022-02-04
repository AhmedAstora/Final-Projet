import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey[400],width: 1.w)
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(

                    child: Image.asset(

                      'assets/images/test_photo.png',
                      width: 160.w,
                      height: 128.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Chocolate Bakery',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A4A4A)),
                    ),
                  ),

                  Container(
                    width: 160.w,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                          alignment: Alignment.center,
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              color: Color(0xFF33907C),
                              borderRadius: BorderRadius.circular(30.r)),
                          child: Text(
                            'T',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          'Tradly',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.sp),
                        ),
                        Spacer(),
                        Text(
                          '\$35',
                          style: TextStyle(
                              decoration:
                              TextDecoration.lineThrough,
                              color: Colors.grey,
                              fontSize: 11.sp),
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '\$25',
                          style: TextStyle(

                              color: Color(0xFF33907C),
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
