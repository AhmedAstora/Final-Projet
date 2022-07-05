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
    return
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
            );
  }

}
class CustomButtoncart extends StatelessWidget {
  String title;
  Color backgroudColor;
  Color titleColor;

  CustomButtoncart({this.title, this.backgroudColor, this.titleColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
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
            );
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
    return
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
            );
  }

}


class CustomButtonorder extends StatelessWidget {
  String title;
  Color backgroudColor;
  Color titleColor;

  CustomButtonorder({this.title, this.backgroudColor, this.titleColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
            Container(
              alignment: Alignment.center,
              width: 113.w,
              height: 25.h,

              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF33907C),width: 1),
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
            );
  }

}
class CustomButtonorderConfirmed extends StatelessWidget {
  String title;
  Color backgroudColor;
  Color titleColor;

  CustomButtonorderConfirmed({this.title, this.backgroudColor, this.titleColor});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
            Container(
              alignment: Alignment.center,
              width: 149.w,
              height: 25.h,

              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF33907C),width: 1),
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
            );
  }

}