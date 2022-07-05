import 'package:finalprojectflutter/Models/productmodel.dart';
import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/AddProductScreen/Edit_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductEdit extends StatelessWidget {
  bool isForEdit;
  String productId;
  Product product;

  ProductEdit({this.isForEdit = false, this.productId, this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductProvider>(builder: (context, provider, x) {
      return Stack(
        children: [
          Container(
            width: 160,
            height: 200,
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
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                        alignment: Alignment.center,
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color: Color(0xFF33907C),
                            borderRadius: BorderRadius.circular(30.r)),
                        child: Text(
                          product.name[0].toUpperCase(),
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
                        '\$'  + product.offerPrice.toString(),
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
          Container(
            width: 160,
            height: 200,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 25.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 1.w,
                ),
                InkWell(
                  onTap: () {
                    RouterClass.routerClass
                        .pushToSpecificScreen(EditProductScreen(
                      product: product,
                    ));

                    provider.nameController.text  = product.name;
                    provider.CategoryController.text  = product.category;
                    provider.priceController.text  = product.price.toString();
                    provider.OfferpriceController.text  = product.offerPrice.toString();
                    provider.LocationController.text  = product.locationDetails;
                    provider.descriptionController.text  = product.descriptionProduct;
                    provider.ConditionController.text  = product.condition;
                    provider.PriceTypeController.text  = product.priceType;
                    provider.AdditionalDetailsController  = product.AdditionalDetails;
                    provider.imageUrl = product.imageUrl;
                    provider.notifyListeners();

                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                        color: Colors.white.withOpacity(0.3)),
                    child: Icon(
                      Icons.edit_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    provider.deleteProduct(product.id);
                    provider.getAllProducts();
                    provider.getSpacificProduct();
                    provider.notifyListeners();
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                        color: Colors.white.withOpacity(0.3)),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
