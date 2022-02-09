import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Providers/mainpageprovider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/CartScreen/cartscreen.dart';
import 'package:finalprojectflutter/Screens/FavoriteScreen/favorite_screen.dart';
import 'package:finalprojectflutter/Screens/HistoryScreen/history_screen.dart';
import 'package:finalprojectflutter/Screens/Product%20Details/productdetails.dart';
import 'package:finalprojectflutter/Screens/ProfileScreen/profile_screen.dart';
import 'package:finalprojectflutter/Screens/SearchScreen/search_screen.dart';
import 'package:finalprojectflutter/Screens/StoreScreen/storescreen.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/button_navigation.dart';
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
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Consumer<MainPageProvider>(
            builder: (cnx, provider, x) => Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex:
                        Provider.of<MainPageProvider>(context, listen: false)
                            .IndexNavigationButton,
                    onTap: (value) {
                      Provider.of<MainPageProvider>(context, listen: false)
                          .IndexNavigationButton = value;
                      Provider.of<MainPageProvider>(context, listen: false)
                          .notifyListeners();
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
                          label: 'Store',
                          icon: Icon(Icons.storefront_outlined)),
                      BottomNavigationBarItem(
                          label: 'History', icon: Icon(Icons.article_rounded)),
                      BottomNavigationBarItem(
                          label: 'Profile', icon: Icon(Icons.person_rounded)),
                    ],
                  ),
                  body: Provider.of<MainPageProvider>(context, listen: false)
                              .IndexNavigationButton ==
                          0
                      ? MainPageContent()
                      : Provider.of<MainPageProvider>(context, listen: false)
                                  .IndexNavigationButton ==
                              1
                          ? SearchScreen()
                          : Provider.of<MainPageProvider>(context,
                                          listen: false)
                                      .IndexNavigationButton ==
                                  2
                              ? StoreScreen()
                              : Provider.of<MainPageProvider>(context,
                                              listen: false)
                                          .IndexNavigationButton ==
                                      3
                                  ? HistoryScreen()
                                  : Provider.of<MainPageProvider>(context,
                                                  listen: false)
                                              .IndexNavigationButton ==
                                          4
                                      ? ProfileScreen()
                                      : StoreScreen(),
                )));
  }
}

class MainPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Scaffold(
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
                        RouterClass.routerClass
                            .pushToSpecificScreenUsingWidget(FavoriteScreen());
                      },
                      icon: Icon(Icons.favorite_rounded)),
                  IconButton(
                      onPressed: () {
                        RouterClass.routerClass
                            .pushToSpecificScreenUsingWidget(CartScreen());
                      },
                      icon: Image.asset('assets/images/Cart.png')),
                ],
                bottom: AppBarsize(),
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Row(
                        children: [FirstAdv(), FirstAdv()],
                      ),
                      scrollDirection: Axis.horizontal,
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
                            Category(),
                            Category(),
                            Category(),
                            Category(),
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
                            Category(),
                            Category(),
                            Category(),
                            Category()
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
                    ProductWidget(),
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
                        children: [
                          ProductWidget(),
                          ProductWidget(),
                          ProductWidget(),
                          ProductWidget(),
                        ],
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
                            margin: EdgeInsets.only(left: 10.w, bottom: 10.h),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Store(),
                                      Store(),
                                      Store(),
                                    ],
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
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90.h,
        color: const Color(0xFF33907C),
        child: SearchTextfield(
          labelText: 'Search Product',
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(90.h);
  }
}

Widget Category() {
  return Stack(
    children: [
      Container(
        width: 98.w,
        height: 98.w,
        child: Image.asset(
          'assets/images/image.png',
          fit: BoxFit.cover,
        ),
      ),
      Container(
          width: 98.w,
          height: 98.w,
          alignment: Alignment.center,
          child: const Text(
            'Pet Care',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ))
    ],
  );
}
