import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:finalprojectflutter/Screens/StoreScreen/create_new_store.dart';
import 'package:finalprojectflutter/Widget/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AddProductProvider>(
      builder: (context,provider,x) {
        return Scaffold(
            backgroundColor: Color(0xFFF6F9FF),
            appBar: AppBar(
              title: Text(
                'Favorite',
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
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  mainAxisExtent: 228.h),
              itemBuilder: (_, index) => ProductWidget(product: provider.FaveProduct[index],),
              itemCount: provider.FaveProduct.length,
            ));
      }
    );
  }
}
