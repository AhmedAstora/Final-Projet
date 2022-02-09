import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/CartScreen/cartscreen.dart';
import 'package:finalprojectflutter/Screens/Product%20Details/productdetails.dart';
import 'package:finalprojectflutter/Screens/StoreScreen/body_empty_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'body_store.dart';

class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Consumer<AuthProvider>(
              builder: (cnx, provider, x) {
                return Scaffold(
                  backgroundColor: Color(0xFFF6F9FF),
                  appBar: AppBar(
                    title: Text(
                      'My Store',
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
                                .pushToSpecificScreenUsingWidget(
                                    ProductDetails());
                          },
                          icon: Icon(Icons.favorite_rounded)),
                      IconButton(
                          onPressed: () {
                            RouterClass.routerClass
                                .pushToSpecificScreenUsingWidget(CartScreen());
                          },
                          icon: Image.asset('assets/images/Cart.png')),
                    ],
                  ),
                  body: provider.loggedUser.isseller &&
                          !provider.loggedUser.haveStore
                      ? EmptyStoreBody()
                      : StoreBody(),
                );
              },
            ));
  }
}
