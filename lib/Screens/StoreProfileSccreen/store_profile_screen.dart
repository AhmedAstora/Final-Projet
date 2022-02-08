import 'dart:developer';

import 'package:finalprojectflutter/Providers/add_address_provider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/SearchScreen/search_screen.dart';
import 'package:finalprojectflutter/Screens/StoreScreen/create_new_store.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/product.dart';
import 'package:finalprojectflutter/Widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StoreProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFF6F9FF),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                RouterClass.routerClass
                    .pushToSpecificScreenUsingWidget(SearchScreenStore());
              },
              icon: Image.asset(
                'assets/images/search.png',
                color: Colors.white,
              ))
        ],
        title: Text(
          'Tradly Store',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
            width: double.infinity,
            height: 240.h,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 48.w,
                      height: 48.h,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xFF33907C),
                          border: Border.all(color: Colors.white, width: 1.w),
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        'T',
                        style: TextStyle(fontSize: 28.sp, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Teadly Store',
                          style:
                              TextStyle(color: Colors.black, fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'tradly.app',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    CustomButtonSeeAll(
                      title: 'Follow',
                      backgroudColor: const Color(0xFF33907C),
                      titleColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                      'sdgjsdjgj sjgsdj gjsd gjsdjg jsdgk jsdjglsdg jsdgsdj gsdjgl jsdg;jgj g fd dfgdfg s;gjl;sdlg fg  fdgdfj;sdgdg fdsdfs dfdf'),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  width: 118.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Groceries'),
                      SizedBox(
                        width: 4.w,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            color: Colors.white,
            width: double.infinity,
            height: 88.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Total Followers'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('0'),
                  ],
                ),
                Column(
                  children: [
                    Text('Total Products'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text('1'),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Consumer<AddressProvider>(
            builder: (cnx, provider, x) {
              return Container(
                padding: EdgeInsets.only(left: 10.w),
                height: 35.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (cnx, index) => InkWell(
                    onTap: () {
                      provider.selected = index;
                      provider.notifyListeners();
                      log(provider.selected.toString());
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        alignment: Alignment.center,
                        width: 103,
                        decoration: BoxDecoration(
                            color: provider.selected == index
                                ? Color(0xFF33907C)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(19),
                            border: Border.all(color: Colors.grey, width: 1.w)),
                        height: 31.h,
                        child: Text(
                          'All Products',
                          style: TextStyle(
                              color: provider.selected == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20.h),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    mainAxisExtent: 228.h),
                itemBuilder: (_, index) => ProductWidget(),
                itemCount: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchScreenStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xFF33907C),
              title: TextFormField(
                  style: TextStyle(color: Colors.grey[700]),
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    suffixIcon: Image.asset(
                      'assets/images/search.png',
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white)),
                    errorStyle: TextStyle(fontSize: 14.sp),
                    fillColor: Color(0xFF33907C),
                    filled: true,
                    hintText: 'Search Product',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  )),
              bottom: AppBarsizeSearchStore(),
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

class AppBarsizeSearchStore extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45.h,
        color: const Color(0xFF33907C),
        child: Column(
          children: [
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
    return Size.fromHeight(80.h);
  }
}
