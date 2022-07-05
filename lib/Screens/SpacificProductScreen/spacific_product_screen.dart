import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:finalprojectflutter/Screens/SearchScreen/search_screen.dart';
import 'package:finalprojectflutter/Screens/StoreScreen/create_new_store.dart';
import 'package:finalprojectflutter/Widget/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpacificProductScreen extends StatelessWidget {
  String title;

  SpacificProductScreen({this.title});

  List<RowSearchClass> listsearch = [
    RowSearchClass(title: 'Sort by', icon: Icons.sort_rounded),
    RowSearchClass(title: 'Location', icon: Icons.location_on_rounded),
    RowSearchClass(title: 'category', icon: Icons.list),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AddProductProvider>(builder: (context, provider, x) {
      return Scaffold(
          backgroundColor: Color(0xFFF6F9FF),
          appBar: AppBar(
            title: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 24.sp),
            ),
            elevation: 0,
            backgroundColor: Color(0xFF33907C),
            centerTitle: true,
            bottom: AppBarSpacificProductScreen(),
          ),
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                mainAxisExtent: 228.h),
            itemBuilder: (_, index) => ProductWidget(
              product: provider.allProducts[index],
            ),
            itemCount: provider.allProducts.length,
          ));
    });
  }
}

class AppBarSpacificProductScreen extends StatelessWidget
    with PreferredSizeWidget {
  List<RowSearchClass> listsearch = [
    RowSearchClass(title: 'Sort by', icon: Icons.sort_rounded),
    RowSearchClass(title: 'Location', icon: Icons.location_on_rounded),
    RowSearchClass(title: 'category', icon: Icons.list),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFF33907C),
        ),
        SizedBox(
          height: 15.h,
        ),
        Divider(
          thickness: 1.3,
          color: Colors.grey[300],
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 35.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listsearch.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => RowSearch(
                listsearch[index].title, listsearch[index].icon, index),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(80.h);
  }
}
