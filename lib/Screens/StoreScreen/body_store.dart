import 'package:dotted_border/dotted_border.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/AddProductScreen/add_product_screen.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/product_edit_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Column(children: [
              Container(
                color: Color(0xFF33907C),
                width: double.infinity,
                height: 30.h,
              ),
              BodyStore(),
              ProductStore(),
            ]));
  }
}

Widget EmptyAddStore() {
  return Column(
    children: [
      SizedBox(
        height: 65.h,
      ),
      Text(
        'You don\'t have product',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      SizedBox(
        height: 100.h,
      ),
      InkWell(
        onTap: () {
          RouterClass.routerClass
              .pushToSpecificScreenUsingWidget(AddProductScreen());
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 90.w),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF33907C)),
                borderRadius: BorderRadius.circular(30)),
            child: CustomButton(
                title: 'Add Product', titleColor: Color(0xFF33907C))),
      ),
    ],
  );
}

class ProductStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 35.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          child: TextFormField(
              style: TextStyle(color: Colors.grey[700]),
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                  errorStyle: TextStyle(fontSize: 14.sp),
                  prefixIcon: Image.asset(
                    'assets/images/search.png',
                    color: Color(0xFF33907C),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search Product',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white)))),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w,vertical: 20.h),
          child: Text(
            'Products',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            ProductEdit(),
            DottedBorderProduct(),

          ],
        ),
      ],
    );
  }
}
class DottedBorderProduct extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      dashPattern: [6, 6],
      color: Colors.grey,
      strokeWidth: 2,
      child: Container(
        width: 160.w,
        height: 190.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.add_rounded,
              color: Colors.grey,
              size: 45,
            ),
            SizedBox(height: 10.h,),
            Text(
              'Add Product',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.grey),
            ),

          ],
        ),
      ),
    );
  }

}



class BodyStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 229.h,
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 25.h),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                alignment: Alignment.center,
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                    color: Color(0xFF33907C),
                    borderRadius: BorderRadius.circular(30.r)),
                child: Text(
                  'T',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp),
                ),
              ),
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Tradly Store',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF33907C)),
                    borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.only(bottom: 10.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButtonSeeAll(
                    title: 'Edit Store',
                    backgroudColor: Colors.white,
                    titleColor: Color(0xFF33907C),
                  ),
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                decoration: BoxDecoration(
                    color: Color(0xFF33907C),
                    borderRadius: BorderRadius.circular(30)),
                margin: EdgeInsets.only(bottom: 10.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButtonSeeAll(
                    title: 'View Store',
                    backgroudColor: Color(0xFF33907C),
                    titleColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Remove Store',
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
