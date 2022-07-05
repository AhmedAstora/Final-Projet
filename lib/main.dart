import 'package:easy_localization/easy_localization.dart';
import 'package:finalprojectflutter/Providers/add_address_provider.dart';
import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Screens/LoginScreen/loginscreen.dart';
import 'package:finalprojectflutter/Screens/SignUpScreen/signupscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:provider/provider.dart';

import 'Providers/add_product_provider.dart';
import 'Providers/pageviewprovider.dart';
import 'Router/router.dart';
import 'Screens/AddProductScreen/Edit_product_screen.dart';
import 'Screens/AddProductScreen/add_product_screen.dart';
import 'Screens/CartScreen/add_new_address.dart';
import 'Screens/CartScreen/cartscreen.dart';
import 'Screens/FavoriteScreen/favorite_screen.dart';
import 'Screens/MainScreen/mainscreen.dart';
import 'Screens/PageViewSlider/pageview.dart';
import 'Screens/Product Details/productdetails.dart';
import 'Screens/ProfileScreen/profile_screen.dart';
import 'Screens/SearchScreen/search_screen.dart';
import 'Screens/SignUpScreen/pinput_screen.dart';
import 'Screens/SignUpScreen/send_code_phone.dart';
import 'Screens/SignUpScreen/type_user_screen.dart';
import 'Screens/SpacificProductScreen/spacific_product_screen.dart';
import 'Screens/SplashScreen/splashscreen.dart';
import 'Screens/StoreProfileSccreen/search_screen_store.dart';
import 'Screens/StoreProfileSccreen/store_profile_screen.dart';
import 'Screens/StoreScreen/create_new_store.dart';
import 'SharedPreferance/shared_preferance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SpHelper.spHelper.initSharedPrefrences();
  await Firebase.initializeApp();

  await runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PageViewProvider>(
          create: (context) {
            return PageViewProvider();
          },
        ),
        ChangeNotifierProvider<AddProductProvider>(
          create: (context) {
            return AddProductProvider();
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
        navigatorKey: RouterClass.routerClass.srouterKey,
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
        routes: {
          '/SplachScreen': (context) => SplachScreen(),
          '/LoginScreen': (context) => LoginScreen(),
          '/SignUpScreen': (context) => SignUpScreen(),
          '/PinputScreen': (context) => PinputScreen(),
          '/MainScreen': (context) => MainScreen(),
          '/FavoriteScreen': (context) => FavoriteScreen(),
          '/SearchScreen': (context) => SearchScreen(),
          '/CartScreen': (context) => CartScreen(),
          '/ProfileScreen': (context) => ProfileScreen(),
          '/AddProductScreen': (context) => AddProductScreen(),
          '/AddAddressScreen': (context) => AddAddressScreen(),
          '/ProductDetails': (context) => ProductDetails(),
          '/AddAddressScreen': (context) => AddAddressScreen(),
          '/TypeUserScreen': (context) => TypeUserScreen(),
          '/PageViewr': (context) => PageViewr(),
          '/SearchScreenStore': (context) => SearchScreenStore(),
          '/CreateNewStore': (context) => CreateNewStore(),
          '/EditProductScreen': (context) => EditProductScreen(),
          '/StoreProfileScreen': (context) => StoreProfileScreen(),
          '/SpacificProductScreen': (context) => SpacificProductScreen(),
        },
      ),
    );
  }
}
/*
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   GoogleMapController mapController;

  final LatLng _center = const LatLng(31.5122807, 34.4358912);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: (GoogleMapController controller){
            mapController = controller;
          },
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 13.0,
          ),
        ),
      ),
    );
  }
}
*/
