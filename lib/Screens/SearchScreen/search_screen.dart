import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/CartScreen/cartscreen.dart';
import 'package:finalprojectflutter/Screens/MainScreen/mainscreen.dart';
import 'package:finalprojectflutter/Screens/Product%20Details/productdetails.dart';
import 'package:finalprojectflutter/Widget/product.dart';
import 'package:finalprojectflutter/Widget/product_edit_store.dart';
import 'package:finalprojectflutter/Widget/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Scaffold(
            appBar: AppBar(
              title: Text(
                'Browse',
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
              bottom: AppBarsizeSearch(),
            ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  mainAxisExtent: 228.h),
              itemBuilder: (_, index) => ProductWidget(),
              itemCount: 18,
            )));
  }
}

class AppBarsizeSearch extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140.h,
        color: const Color(0xFF33907C),
        child: Column(
          children: [
            SearchTextfield(
              labelText: 'Search Product',
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RowSearch('Sort by', Icons.sort_rounded),
                RowSearch('Location', Icons.location_on_rounded),
                RowSearch('category', Icons.list),
              ],
            )
          ],
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(140.h);
  }
}

Widget RowSearch(String title, IconData iconData) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white, width: 1.w)),
    width: 112.w,
    height: 31.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: Colors.white,
          size: 20,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}
