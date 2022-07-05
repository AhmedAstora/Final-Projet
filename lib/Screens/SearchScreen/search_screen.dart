import 'package:finalprojectflutter/Models/productmodel.dart';
import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:finalprojectflutter/Providers/authProvider.dart';
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
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductProvider>(builder: (context, provider, x) {
      return Scaffold(
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
                        .pushToSpecificScreenUsingWidget('/FavoriteScreen');
                  },
                  icon: Icon(Icons.favorite_rounded)),
              IconButton(
                  onPressed: () {
                    RouterClass.routerClass
                        .pushToSpecificScreenUsingWidget('/CartScreen');
                  },
                  icon: Image.asset('assets/images/EmptyCart.png')),
            ],
            bottom: AppBarsizeSearch(),
          ),
          body: provider.SearchProductsList.length != 0
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      mainAxisExtent: 228.h),
                  itemBuilder: (_, index) =>
                      provider.searchController.text != ''
                          ? ProductWidget(
                              product: provider.SearchProductsList[index],
                              user: provider.loggedUser,
                            )
                          : ProductWidget(
                              product: provider.allProducts[index],
                              user: provider.loggedUser,
                            ),
                  itemCount: provider.searchController.text != ''
                      ? provider.SearchProductsList.length != 0
                          ? provider.SearchProductsList.length
                          : 0
                      : provider.allProducts.length,
                )
              : Center(
                  child: Lottie.asset('assets/animations/emptySearch.json',
                      width: 250.w, height: 250.h)));
    });
  }
}

class AppBarsizeSearch extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductProvider>(builder: (context, provider, x) {
      return Container(
          height: 140.h,
          color: const Color(0xFF33907C),
          child: Column(children: [
            Container(
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              child: TextFormField(
                  onChanged: (value) => provider.SearchProduct(value),
                  autofocus: true,
                  style: TextStyle(color: Colors.grey[700]),
                  keyboardType: TextInputType.text,
                  controller: provider.searchController,
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
            SizedBox(
              height: 15.h,
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
            )
          ]));
    });
  }

  List<RowSearchClass> listsearch = [
    RowSearchClass(title: 'Sort by', icon: Icons.sort_rounded),
    RowSearchClass(title: 'Location', icon: Icons.location_on_rounded),
    RowSearchClass(title: 'category', icon: Icons.list),
  ];

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(140.h);
  }
}

Widget RowSearch(String title, IconData iconData, int index) {
  return Consumer<AddProductProvider>(builder: (context, provider, x) {
    return InkWell(
      onTap: () {
        provider.selected = index;
        provider.notifyListeners();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
            color:
                provider.selected == index ? Colors.white : Color(0xFF33907C),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: provider.selected == index
                    ? Color(0xFF33907C)
                    : Colors.white,
                width: 1.w)),
        width: 112.w,
        height: 31.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color:
                  provider.selected == index ? Color(0xFF33907C) : Colors.white,
              size: 20,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: TextStyle(
                  color: provider.selected == index
                      ? Color(0xFF33907C)
                      : Colors.white),
            )
          ],
        ),
      ),
    );
  });
}

class RowSearchClass {
  String title;
  IconData icon;

  RowSearchClass({this.title, this.icon});
}
