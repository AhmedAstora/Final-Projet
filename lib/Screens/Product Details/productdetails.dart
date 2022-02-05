import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFF33907C)));
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Scaffold(
              backgroundColor: Colors.grey[300],
              extendBodyBehindAppBar: true,
              body: Container(
                margin: EdgeInsets.only(top: 28.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/image.png',
                            width: double.infinity,
                            height: 226.h,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 15.h, horizontal: 10.w),
                            child: Row(
                              children: [
                                Spacer(),
                                IconsWidget(Icons.share),
                                SizedBox(
                                  width: 12.w,
                                ),
                                IconsWidget(Icons.favorite_border_outlined),
                                SizedBox(
                                  width: 12.w,
                                ),
                                IconsWidget(Icons.more_vert_rounded),
                                SizedBox(
                                  width: 12.w,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        width: double.infinity,
                        height: 95.h,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              'Coca Cola',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color(0xFF4F4F4F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '\$25',
                                  style: TextStyle(
                                      color: Color(0xFF33907C),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  '\$35',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  '50% off',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        width: double.infinity,
                        height: 72.h,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2.h, horizontal: 2.w),
                              alignment: Alignment.center,
                              width: 32.w,
                              height: 32.h,
                              decoration: BoxDecoration(
                                  color: Color(0xFF33907C),
                                  borderRadius: BorderRadius.circular(30.r)),
                              child: Text(
                                'T',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Tradly Store',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            Spacer(),
                            CustomButtonSeeAll(
                              title: 'Follow',
                              backgroudColor: const Color(0xFF33907C),
                              titleColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 55.h, horizontal: 30.w),
                        width: double.infinity,
                        height: 353.h,
                        color: Colors.white,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lobortis cras placerat diam ipsum ut. Nisi vel adipiscing massa bibendum diam. Suspendisse mattis dui maecenas duis mattis. Mattis aliquam at arcu, semper nunc, venenatis et pellentesque eu. Id tristique maecenas tristique habitasse eu elementum sed. Aliquam eget lacus, arcu, adipiscing eget feugiat in dolor sagittis.
                                  
Non commodo, a justo massa porttitor sed placerat in. Orci tristique etiam tempus sed. Mi varius morbi egestas dictum tempor nisl. In '''),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 10.h),
                        width: double.infinity,
                        height: 195.h,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.sp),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Condition',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(
                                  'Organic',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Price Type',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(
                                  'Fixed',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Category',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(
                                  'Beverages',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Location',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                Text(
                                  'Kualalumpur, Malaysia',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: 30.w,left: 30.w, top: 10.h,bottom: 20.w),
                        color: Colors.white,
                        width: double.infinity,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Additional Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 18.sp),
                            ),SizedBox(height: 30.h,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              Text(
                                'Delivery Details',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 14.sp),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text(
                                  'Home Delivery Available, ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp),
                                ),
                                Text(
                                  'Cash On Delivery',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14.sp),
                                ),
                              ],)
                            ],)
                          ],
                        ),
                      ),
                      SizedBox(height: 6.h,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30.h),
                        color: Colors.white,
                        child: CustomButtoncart(
                          title: 'Add To Cart',
                          titleColor: Colors.white,
                          backgroudColor: Color(0xFF33907C),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
