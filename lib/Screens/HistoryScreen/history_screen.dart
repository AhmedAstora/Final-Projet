import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/CartScreen/cartscreen.dart';
import 'package:finalprojectflutter/Screens/Product%20Details/productdetails.dart';
import 'package:finalprojectflutter/Widget/button_navigation.dart';
import 'package:finalprojectflutter/Widget/order_history_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Scaffold(
              backgroundColor: Color(0xFFF6F9FF),
              appBar: AppBar(
                title: Text(
                  'Order History',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 24.sp),
                ),
                elevation: 0,
                backgroundColor: Color(0xFF33907C),
                actions: [
                  IconButton(
                      onPressed: () {
                        RouterClass.routerClass
                            .pushToSpecificScreenUsingWidget(ProductDetails());
                      },
                      icon: Icon(Icons.favorite_rounded)),
                  IconButton(
                      onPressed: () {
                        RouterClass.routerClass
                            .pushToSpecificScreenUsingWidget(CartScreen());
                      },
                      icon: Image.asset('assets/images/Cart.png')),
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Color(0xFF33907C),
                    width: double.infinity,
                    height: 30.h,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 25.h,horizontal: 12.w),
                        child: Row(
                          children: [
                            Text(
                              'Transactions',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.sp),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xFF33907C).withOpacity(0.2)),
                              child: Text(
                                'January 2020',
                                style: TextStyle(
                                    color: Color(0xFF33907C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  OrderHistory(),
                ],
              ),
            ));
  }
}
