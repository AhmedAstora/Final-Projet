import 'package:finalprojectflutter/Providers/mainpageprovider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/MainScreen/mainscreen.dart';
import 'package:finalprojectflutter/Screens/StoreScreen/storescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ButtonNavigation extends StatelessWidget {
  Color itemcolor = Color(0xFF33907C);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      designSize: Size(393, 851),
      minTextAdapt: true,
      builder: () => BottomNavigationBar(
        currentIndex: Provider.of<MainPageProvider>(context, listen: false)
            .IndexNavigationButton,
        onTap: (value) {
          Provider.of<MainPageProvider>(context, listen: false)
              .IndexNavigationButton = value;
          Provider.of<MainPageProvider>(context, listen: false)
              .notifyListeners();

          switch (value) {
            case 0:
              RouterClass.routerClass
                  .pushReplaceToSpecificScreenUsingWidget(MainScreen());
              break;
            case 1:
              RouterClass.routerClass
                  .pushReplaceToSpecificScreenUsingWidget(StoreScreen());
              break;
            case 2:
              RouterClass.routerClass
                  .pushReplaceToSpecificScreenUsingWidget(StoreScreen());
              break;
            case 3:
              RouterClass.routerClass
                  .pushReplaceToSpecificScreenUsingWidget(StoreScreen());
              break;
            case 4:
              RouterClass.routerClass
                  .pushReplaceToSpecificScreenUsingWidget(StoreScreen());
              break;
          }
        },
        iconSize: 28.r,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: itemcolor,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_filled)),
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
    );
  }
}
