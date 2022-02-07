import 'package:easy_localization/easy_localization.dart';
import 'package:finalprojectflutter/Providers/add_address_provider.dart';
import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import 'Providers/mainpageprovider.dart';
import 'Providers/pageviewprovider.dart';
import 'Router/router.dart';
import 'Screens/CartScreen/add_new_address.dart';
import 'Screens/CartScreen/cartscreen.dart';
import 'Screens/MainScreen/mainscreen.dart';
import 'Screens/Product Details/productdetails.dart';
import 'Screens/SplashScreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PageViewProvider>(
          create: (context) {
            return PageViewProvider();
          },
        ),
        ChangeNotifierProvider<MainPageProvider>(
          create: (context) {
            return MainPageProvider();
          },
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (context) {
            return AuthProvider();
          },
        ),
        ChangeNotifierProvider<AddressProvider>(
          create: (context) {
            return AddressProvider();
          },
        ),
      ],
      child: EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/langs', // <-- change the path of the translation files
          fallbackLocale: Locale('en'),
          child: MyApps()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale('en'));
    return ScreenUtilInit(
      designSize: Size(393, 851),
      minTextAdapt: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: RouterClass.routerClass.navKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: SplachScreen(),
      ),
    );
  }
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: Size(393, 851),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: RouterClass.routerClass.navKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: SplachScreen(),
        builder: (context, widget) {
          //add this line
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget,
          );
        },
      ),
    );
  }
}
