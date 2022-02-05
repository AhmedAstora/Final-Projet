
import 'package:easy_localization/easy_localization.dart';
import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

import 'Providers/mainpageprovider.dart';
import 'Providers/pageviewprovider.dart';
import 'Router/router.dart';
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
      ],
      child: EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/langs', // <-- change the path of the translation files
          fallbackLocale: Locale('en'),
          child: MyApp()),
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
