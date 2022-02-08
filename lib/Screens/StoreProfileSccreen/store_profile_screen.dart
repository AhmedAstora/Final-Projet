import 'package:finalprojectflutter/Screens/StoreScreen/create_new_store.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFF6F9FF),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/search.png',
                color: Colors.white,
              ))
        ],
        title: Text(
          'Tradly Store',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 24.sp),
        ),
        elevation: 0,
        backgroundColor: Color(0xFF33907C),
        centerTitle: true,
        bottom: AppBarsizeStore(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
            width: double.infinity,
            height: 240.h,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 48.w,
                      height: 48.h,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xFF33907C),
                          border: Border.all(color: Colors.white, width: 1.w),
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        'T',
                        style: TextStyle(fontSize: 28.sp, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Teadly Store',
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'tradly.app',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomButtonSeeAll(
                      title: 'Follow',
                      backgroudColor: const Color(0xFF33907C),
                      titleColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                      'sdgjsdjgj sjgsdj gjsd gjsdjg jsdgk jsdjglsdg jsdgsdj gsdjgl jsdg;jgj g fd dfgdfg s;gjl;sdlg fg  fdgdfj;sdgdg fdsdfs dfdf'),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  width: 118.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Groceries'),
                      SizedBox(
                        width: 4.w,
                      ),
                      const Icon(
                        Icons.close,
                        color: Colors.black,
                        size: 16,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            color: Colors.white,
            width: double.infinity,
            height: 88.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Total Followers'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('0'),
                  ],
                ),
                Column(
                  children: [
                    Text('Total Products'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('1'),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 25.h,),
          RowProductsStore('All Product'),
        ],
      ),
    );
  }
}

Widget RowProductsStore(String title) {
  return Container(
    alignment: Alignment.center,
    width: 103,
      decoration: BoxDecoration(
          color: Color(0xFF33907C),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey, width: 1.w)),
      height: 31.h,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.bold),
      ));
}
