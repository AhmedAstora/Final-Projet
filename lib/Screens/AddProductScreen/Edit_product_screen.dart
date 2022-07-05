import 'dart:async';
import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:finalprojectflutter/Models/productmodel.dart';
import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/custom_address_textfield.dart';
import 'package:finalprojectflutter/Widget/custom_textfield_addproduct.dart';
import 'package:finalprojectflutter/Widget/extend_app_bar.dart';
import 'package:finalprojectflutter/Widget/tag_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class EditProductScreen extends StatelessWidget {
  Product product;
  bool isClicked = false;

  EditProductScreen({this.product});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AddProductProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: Color(0xFFF6F9FF),
        appBar: AppBar(
          centerTitle: true,
          bottom: CustomAppBar(),
          backgroundColor: Color(0xFF33907C),
          title: Text(
            'Edit Product',
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
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                width: double.infinity,
                height: 190.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            provider.pickNewImage();
                            isClicked = true;
                          },
                          child: isClicked
                              ? Container(
                                  alignment: Alignment.center,
                                  width: 150.w,
                                  height: 128.h,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image(
                                          image: FileImage(provider.file),
                                          width: 140.w,
                                          height: 108.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 29,
                                          height: 29,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.black54),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 19,
                                          ),
                                          margin: EdgeInsets.only(bottom: 30.h),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  width: 150.w,
                                  height: 128.h,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image(
                                          image:
                                              NetworkImage(provider.imageUrl),
                                          width: 140.w,
                                          height: 108.h,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 29,
                                          height: 29,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Colors.black54),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 19,
                                          ),
                                          margin: EdgeInsets.only(bottom: 30.h),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      'Max 4 photo per product',
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                color: Colors.white,
                child: Column(
                  children: [
                    CustomTextfieldAddress(
                      controller: provider.nameController,
                      labelText: 'Product Name',
                    ),
                    CustomTextfieldAddress(
                      controller: provider.CategoryController,
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
                          controller: provider.priceController,
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
                          controller: provider.OfferpriceController,
                          labelText: 'Offer Price',
                        ),
                      ],
                    ),
                    Container(
                      height: 60.h,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      child: TextFormField(
                          controller: provider.LocationController,
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.sp),
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                borderSide: BorderSide(color: Colors.grey[400]),
                              ),
                              label: Text('Location Details'))),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      child: TextFormField(
                          controller: provider.descriptionController,
                          maxLines: 4,
                          style:
                              TextStyle(color: Colors.black, fontSize: 16.sp),
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              errorStyle: TextStyle(fontSize: 14.sp),
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[400]),
                              ),
                              label: Text('Product Description'))),
                    ),
                    CustomTextfieldAddress(
                      controller: provider.ConditionController,
                      labelText: 'Condition',
                    ),
                    CustomTextfieldAddress(
                      controller: provider.PriceTypeController,
                      labelText: 'Price Type',
                    ),
                    TagTextfield(
                      Title: 'Additional Details',
                      tag: provider.AdditionalDetailsController,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    RoundedLoadingButton(
                      color: Color(0xFF33907C),
                      child: Text('Edit Product',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp)),
                      controller: provider.btnController,
                      onPressed: () {
                        provider.editProduct(product.id);
                      },
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
