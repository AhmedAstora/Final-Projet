import 'package:finalprojectflutter/Models/productmodel.dart';
import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductCartWidget extends StatelessWidget {
  Product product;

  ProductCartWidget({this.product});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AddProductProvider>(builder: (context, provider, x) {
      return Container(
        width: double.infinity,
        height: 183.h,
        padding: EdgeInsets.only(top: 30.h, left: 25.w, bottom: 15.h),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('coca Cola'),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
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
                            '\$50',
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
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (provider.Qty != 1) {
                                provider.Qty--;
                                provider.notifyListeners();
                              }
                            },
                            child: Container(
                              width: 25.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey[300],
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text('Qty  ${provider.Qty}'),
                          SizedBox(
                            width: 6.w,
                          ),
                          InkWell(
                            onTap: () {
                              provider.Qty++;
                              provider.notifyListeners();
                            },
                            child: Container(
                              width: 25.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey[300],
                              ),
                              child: Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Remove',
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            )
          ],
        ),
      );
    });
  }
}
