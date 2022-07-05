import 'dart:async';

import 'package:finalprojectflutter/Data/secondrydata.dart';
import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Providers/pageviewprovider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/CartScreen/cartscreen.dart';
import 'package:finalprojectflutter/Screens/FavoriteScreen/favorite_screen.dart';
import 'package:finalprojectflutter/Screens/HistoryScreen/history_screen.dart';
import 'package:finalprojectflutter/Screens/PageViewSlider/pageview.dart';
import 'package:finalprojectflutter/Screens/ProfileScreen/profile_screen.dart';
import 'package:finalprojectflutter/Screens/SearchScreen/search_screen.dart';
import 'package:finalprojectflutter/Screens/SpacificProductScreen/spacific_product_screen.dart';
import 'package:finalprojectflutter/Screens/StoreScreen/storescreen.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/firstadv.dart';
import 'package:finalprojectflutter/Widget/product.dart';
import 'package:finalprojectflutter/Widget/store.dart';
import 'package:finalprojectflutter/Widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  Color itemcolor = Color(0xFF33907C);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AuthProvider>(
        builder: (cnx, provider, x) => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: provider.IndexNavigationButton,
                onTap: (value) {
                  provider.IndexNavigationButton = value;
                  provider.notifyListeners();
                },
                iconSize: 28.r,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: itemcolor,
                items: const [
                  BottomNavigationBarItem(
                      label: 'Home', icon: Icon(Icons.home_filled)),
                  BottomNavigationBarItem(
                      label: 'Search', icon: Icon(Icons.search_rounded)),
                  BottomNavigationBarItem(
                      label: 'Store', icon: Icon(Icons.storefront_outlined)),
                  BottomNavigationBarItem(
                      label: 'History', icon: Icon(Icons.article_rounded)),
                  BottomNavigationBarItem(
                      label: 'Profile', icon: Icon(Icons.person_rounded)),
                ],
              ),
              body: provider.IndexNavigationButton == 0
                  ? MainPageContent()
                  : provider.IndexNavigationButton == 1
                      ? SearchScreen()
                      : provider.IndexNavigationButton == 2
                          ? StoreScreen()
                          : provider.IndexNavigationButton == 3
                              ? HistoryScreen()
                              : provider.IndexNavigationButton == 4
                                  ? ProfileScreen()
                                  : StoreScreen(),
            ));
  }
}

class MainPageContent extends StatelessWidget {
  PageController controller = PageController();

  void _animateSlider(BuildContext context) {
    Future.delayed(Duration(seconds: 10)).then((_) {
      int nextPage = controller.page.round() + 1;
      if (nextPage == 3) {
        nextPage = 0;
      }

      controller
          .animateToPage(nextPage,
              duration: Duration(seconds: 2), curve: Curves.easeIn)
          .then((_) => _animateSlider(context));
    });
  }

  @override
  Widget build(BuildContext context) {
    _animateSlider(context);
    // TODO: implement build
    return Consumer3<AuthProvider, AddProductProvider, PageViewProvider>(
        builder: (cnx, provider, addprovider, pageprovider, x) => Scaffold(
              appBar: AppBar(
                title: Text(
                  'Groceries',
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
                        addprovider.getFaveProducts();
                        RouterClass.routerClass
                            .pushToSpecificScreenUsingWidget('/FavoriteScreen');
                      },
                      icon: Icon(Icons.favorite_rounded)),
                  IconButton(
                      onPressed: () {
                        RouterClass.routerClass
                            .pushToSpecificScreenUsingWidget('/CartScreen');
                      },
                      icon: Image.asset('assets/images/Cart.png')),
                ],
                bottom: AppBarsize(provider),
              ),
              body: addprovider.allProducts == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 190,
                            child: Stack(
                              children: [
                                Container(
                                  height: 190,
                                  width: double.infinity,
                                  child: PageView(
                                      onPageChanged: (value) {
                                        pageprovider.currentIndex = value;
                                        pageprovider.notifyListeners();
                                      },
                                      controller: controller,
                                      children: ViewPager.pageViewDataMain
                                          .map((e) => Container(
                                                color: Colors.white,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.w,
                                                    vertical: 10.h),
                                                width: 300.w,
                                                height: 170.h,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.asset(
                                                    e,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ))
                                          .toList()),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 20.h),
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: IndicatorMain(
                                            pageprovider.currentIndex)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 98.h,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Category('assets/images/Beverages.png',
                                      'Beverages'),
                                  Category('assets/images/Bread.png',
                                      'Bread & Bakery'),
                                  Category('assets/images/Vegetables.png',
                                      'Vegetables'),
                                  Category('assets/images/Fruit.png', 'Fruit')
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 98.h,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Category('assets/images/Egg.png', 'Egg'),
                                  Category('assets/images/Frozen Veg.png',
                                      'Frozen veg'),
                                  Category('assets/images/Homecare.png',
                                      'Home Care'),
                                  Category(
                                      'assets/images/Pet care.png', 'Pet Care'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              children: [
                                Text(
                                  'New Products',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF4F4F4F)),
                                ),
                                const Spacer(),
                                CustomButtonSeeAll(
                                  title: 'See All',
                                  backgroudColor: const Color(0xFF33907C),
                                  titleColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: Provider.of<AddProductProvider>(context,
                                      listen: false)
                                  .allProducts
                                  .map((e) => ProductWidget(
                                        product: e,
                                        user: provider.loggedUser,
                                      ))
                                  .toList(),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Row(
                              children: [
                                Text(
                                  'Popular Product',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF4F4F4F)),
                                ),
                                const Spacer(),
                                CustomButtonSeeAll(
                                  title: 'See All',
                                  backgroudColor: const Color(0xFF33907C),
                                  titleColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: Provider.of<AddProductProvider>(context,
                                      listen: false)
                                  .allProducts
                                  .map((e) => ProductWidget(
                                        product: e,
                                        user: provider.loggedUser,
                                      ))
                                  .toList(),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Container(
                            height: 355,
                            child: Stack(
                              children: [
                                Container(
                                  height: 185.h,
                                  color: Color(0xFF33907C),
                                  padding: EdgeInsets.only(
                                    left: 15.w,
                                    right: 15,
                                    top: 25,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Store To follow',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp,
                                              fontFamily: 'Montserrat',
                                              color: Colors.white),
                                        ),
                                        const Spacer(),
                                        CustomButtonSeeAll(
                                          title: 'View All',
                                          backgroudColor: Colors.white,
                                          titleColor: Color(0xFF33907C),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: 10.w, bottom: 10.h),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: provider.allusers
                                              .map((e) => Store(
                                                    user: e,
                                                    index: provider.allusers
                                                        .indexOf(e),
                                                  ))
                                              .toList(),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ));
  }
}

class AppBarsize extends StatelessWidget with PreferredSizeWidget {
  AuthProvider provider;

  AppBarsize(this.provider);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90.h,
        color: const Color(0xFF33907C),
        child: Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          child: TextFormField(
              onTap: () {
                provider.IndexNavigationButton = 1;
                provider.notifyListeners();
              },
              style: TextStyle(color: Colors.grey[700]),
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(90.h);
  }
}

Widget Category(String image, String title) {
  return InkWell(
    onTap: () {
      RouterClass.routerClass.pushToSpecificScreen(SpacificProductScreen(
        title: title,
      ));
    },
    child: Container(
        width: 98.w,
        child: Column(
          children: [
            Image.asset(
              image,
              width: 50.h,
              height: 50.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp),
            )
          ],
        )),
  );
}
