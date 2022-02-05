import 'package:finalprojectflutter/Data/secondrydata.dart';
import 'package:finalprojectflutter/Providers/pageviewprovider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/LoginScreen/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PageViewr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () =>
            Consumer<PageViewProvider>(builder: (context, provider, x) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Stack(
                  children: [
                    PageView(
                        onPageChanged: (value) {
                          provider.currentIndex = value;
                          value == 2
                              ? provider.text = 'Get Started'
                              : provider.text = 'Next';
                          provider.notifyListeners();
                        },
                        controller: provider.controller,
                        children: ViewPager.data
                            .map((e) => Container(
                                  child: Column(

                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            color: Color(0xFF33907C),
                                            height: 300.h,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 70.h),
                                                  width: 307.w,
                                                  height: 334.h,
                                                  margin: EdgeInsets.only(
                                                      left: 40.w,
                                                      right: 40.w,
                                                      top: 150.h),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r)),
                                                  child: Container(
                                                    width: 295.w,
                                                    height: 243.h,
                                                    child: Center(
                                                        child: Image.asset(
                                                            e.image)),
                                                  )),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 40.w),
                                                child: Text(
                                                  e.title,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: 19.5.sp,
                                                      color: Color(0xFF33907C),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Montserrat'),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                            .toList()),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                         if(provider.text =='Next') {
                          provider.controller.nextPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);

                          provider.notifyListeners();}else{
                           RouterClass.routerClass.pushReplaceToSpecificScreenUsingWidget(LoginScreen());
                         }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 15.h),
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 50.h,
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: Color(0xFF33907C)),
                          child: Text(
                            provider.text,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 120.h),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Indicator(provider.currentIndex)),
                    ),
                  ],
                ),
              );
            }));
  }
}

class Indicator extends StatelessWidget {
  final int index;

  Indicator(this.index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dots(index == 0 ? 0xFF33907C : 0xFF85BCB0),
        Dots(index == 1 ? 0xFF33907C : 0xFF85BCB0),
        Dots(index == 2 ? 0xFF33907C : 0xFF85BCB0),
      ],
    );
  }

  Widget Dots(int Colordot) {
    return Container(
      margin: EdgeInsets.all(4),
      height: 15,
      width: 15,
      decoration: BoxDecoration(color: Color(Colordot), shape: BoxShape.circle),
    );
  }
}
