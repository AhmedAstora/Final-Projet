import 'package:finalprojectflutter/Models/productmodel.dart';
import 'package:finalprojectflutter/Models/usermodel.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/Product%20Details/productdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  TUser user;
  Product product;

  ProductWidget({this.product, this.user});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        RouterClass.routerClass.pushToSpecificScreen(ProductDetails(product: product));
      },
      child: Container(
        width: 160.h,
        height: 200.h,
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.grey[400], width: 1.w)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(11),
                    topLeft: Radius.circular(11)),
                child: Image.network(
                  product.imageUrl,
                  width: 160.w,
                  height: 128.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                product.name,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A4A4A)),
              ),
            ),
            Container(
              width: 160.w,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                    alignment: Alignment.center,
                    width: 20.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        color: Color(0xFF33907C),
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Text(
                      product.Storename[0],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    product.Storename,
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  Spacer(),
                  Text(
                  '\$'  + product.offerPrice.toString() ,
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                        fontSize: 11.sp),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '\$'  + product.price.toString(),
                    style: TextStyle(
                        color: Color(0xFF33907C),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
