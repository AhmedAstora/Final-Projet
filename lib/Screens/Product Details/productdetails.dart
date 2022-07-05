import 'package:finalprojectflutter/Models/productmodel.dart';
import 'package:finalprojectflutter/Models/usermodel.dart';
import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  Product product;

  ProductDetails({this.product});



  isFaveMethod(BuildContext context) {
    List<dynamic> isFaveProduct = [];

    isFaveProduct = Provider.of<AuthProvider>(context, listen: false)
        .loggedUser
        .favProduct
        .where((element) => element == product.id)
        .toList();

    if (isFaveProduct.length == 1) {
      Provider.of<AddProductProvider>(context, listen: false).isFave = true;
      Provider.of<AddProductProvider>(context, listen: false).notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    isFaveMethod(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xFF33907C).withOpacity(0.9)));
    return Consumer<AddProductProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          margin: EdgeInsets.only(top: 27.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.network(
                      product.imageUrl,
                      width: double.infinity,
                      height: 290.h,
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
                          InkWell(
                            onTap: () {
                              if (provider.isFave) {
                                provider.loggedUser.favProduct
                                    .remove(product.id);
                                provider.EditFaveUser(provider.loggedUser);
                                provider.isFave = false;
                                provider.notifyListeners();
                              } else {
                                provider.loggedUser.favProduct.add(product.id);
                                provider.EditFaveUser(provider.loggedUser);
                                provider.isFave = true;
                                provider.notifyListeners();
                              }
                            },
                            child: IconsWidget(
                              !provider.isFave
                                  ? Icons.favorite_border_outlined
                                  : Icons.favorite_outlined,
                            ),
                          ),
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
                        product.name,
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
                            '\$' + product.price.toString(),
                            style: TextStyle(
                                color: Color(0xFF33907C),
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '\$' + product.offerPrice.toString(),
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Color(0xFF4F4F4F),
                                fontSize: 14.sp),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '50% off',
                            style: TextStyle(
                                color: Color(0xFF4F4F4F), fontSize: 14.sp),
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
                          product.Storename[0].toUpperCase(),
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
                        '${product.Storename} Store',
                        style: TextStyle(
                            color: Color(0xFF4F4F4F),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: CustomButtonSeeAll(
                          title: 'Follow',
                          backgroudColor: const Color(0xFF33907C),
                          titleColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 30.w),
                  width: double.infinity,
                  height: 200.h,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('''${product.descriptionProduct}'''),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.sp),
                          ),
                          SizedBox(
                            width: 40.w,
                          ),
                          Text(
                            product.condition,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.sp),
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.sp),
                          ),
                          SizedBox(
                            width: 40.w,
                          ),
                          Text(
                            product.priceType,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.sp),
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.sp),
                          ),
                          SizedBox(
                            width: 40.w,
                          ),
                          Text(
                            product.category,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.sp),
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.sp),
                          ),
                          SizedBox(
                            width: 40.w,
                          ),
                          Text(
                            product.locationDetails,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.sp),
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
                      right: 30.w, left: 30.w, top: 10.h, bottom: 20.w),
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
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery Details',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.AdditionalDetails,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.sp),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
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
      );
    });
  }
}
