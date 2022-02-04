import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  String title;
  Color backgroudColor;
  Color titleColor;

  CustomButton({this.title, this.backgroudColor, this.titleColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () =>
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50.h,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: backgroudColor),
              child: Text(
                title,
                style: TextStyle(
                    color: titleColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
            ));
  }

}

class CustomButtonSeeAll extends StatelessWidget {
  String title;
  Color backgroudColor;
  Color titleColor;

  CustomButtonSeeAll({this.title, this.backgroudColor, this.titleColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () =>
            Container(
              alignment: Alignment.center,
              width: 85.w,
              height: 25.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: backgroudColor),
              child: Text(
                title,
                style: TextStyle(
                    color: titleColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
              ),
            ));
  }

}