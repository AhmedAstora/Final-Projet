import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/custom_address_textfield.dart';
import 'package:finalprojectflutter/Widget/custom_textfield_addproduct.dart';
import 'package:finalprojectflutter/Widget/extend_app_bar.dart';
import 'package:finalprojectflutter/Widget/tag_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Scaffold(
              backgroundColor: Color(0xFFF6F9FF),
              appBar: AppBar(
                centerTitle: true,
                bottom: CustomAppBar(),
                backgroundColor: Color(0xFF33907C),
                title: Text(
                  'Add Product',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                      color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 190.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      color: Colors.white,
                      child: Column(
                        children: [
                          CustomTextfieldAddress(
                            labelText: 'Product Name',
                          ),
                          CustomTextfieldAddress(
                            labelText: 'Category Product',
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 15.h),
                                  child: Text(
                                    '\$',
                                    style: TextStyle(fontSize: 16.sp),
                                  )),
                              CustomTextfieldProduct(
                                labelText: 'Price',
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 15.h),
                                  child: Text(
                                    '\$',
                                    style: TextStyle(fontSize: 16.sp),
                                  )),
                              CustomTextfieldProduct(
                                labelText: 'Offer Price',
                              ),
                            ],
                          ),
                          Container(
                            height: 60.h,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            child: TextFormField(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.sp),
                                keyboardType: TextInputType.text,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.map_outlined,
                                      color: Colors.grey,
                                    ),
                                    errorStyle: TextStyle(fontSize: 14.sp),
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.sp,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[400]),
                                    ),
                                    label: Text('Location Details'))),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            child: TextFormField(
                                maxLines: 4,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.sp),
                                keyboardType: TextInputType.text,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    errorStyle: TextStyle(fontSize: 14.sp),
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.sp,
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[400]),
                                    ),
                                    label: Text('Product Description'))),
                          ),
                          CustomTextfieldAddress(
                            labelText: 'Condition',
                          ),
                          CustomTextfieldAddress(
                            labelText: 'Price Type',
                          ),
                          TagTextfield('Additional Details'),
                          SizedBox(height: 25.h,),
                          Container(
                            padding: EdgeInsets.only(top: 20.h,bottom: 30.h),
                            color: Colors.white,
                            child: CustomButtoncart(
                              title: 'Add Product',
                              titleColor: Colors.white,
                              backgroudColor: Color(0xFF33907C),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
