import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/CartScreen/cartscreen.dart';
import 'package:finalprojectflutter/Screens/LoginScreen/loginscreen.dart';
import 'package:finalprojectflutter/Screens/Product%20Details/productdetails.dart';
import 'package:finalprojectflutter/Widget/button_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  showAlertDialog(BuildContext context, AuthProvider provider) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "No",
        style: TextStyle(color: Color(0xFF13B58C)),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes", style: TextStyle(color: Color(0xFF13B58C))),
      onPressed: () {
        provider.logOut();
        RouterClass.routerClass
            .pushReplaceToSpecificScreenUsingWidget('/LoginScreen');
        provider.IndexNavigationButton = 0;
        provider.loggedUser = null;
        Provider.of<AddProductProvider>(context, listen: false).loggedUser =
            null;
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Log out"),
      content: Text("Are you sure to Log out?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<AuthProvider>(
      builder: (cnx, provider, x) {
        return Scaffold(
          backgroundColor: Color(0xFFF6F9FF),
          appBar: AppBar(
            title: Text(
              'Profile',
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
                        .pushToSpecificScreenUsingWidget('/ProductDetails');
                  },
                  icon: Icon(Icons.favorite_rounded)),
              IconButton(
                  onPressed: () {
                    RouterClass.routerClass
                        .pushToSpecificScreenUsingWidget('/CartScreen');
                  },
                  icon: Image.asset('assets/images/EmptyCart.png')),
            ],
          ),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  color: Color(0xFF33907C),
                  width: double.infinity,
                  height: 300.h,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 55.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 68.w,
                        height: 68.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        child: Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 64.w,
                              height: 64.h,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 1.w),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Text(
                                provider.loggedUser.Fname[0].toUpperCase(),
                                style: TextStyle(
                                    fontSize: 36.sp, color: Colors.white),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                margin:
                                    EdgeInsets.only(bottom: 10.h, right: 2.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    width: 18.w,
                                    height: 18.h,
                                    color: Colors.grey[200],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            provider.loggedUser.Fname +
                                " " +
                                provider.loggedUser.Lname,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            provider.loggedUser.email,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 150.h),
                  width: double.infinity,
                  height: 266.h,
                  decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 1,
                            color: Colors.grey[300])
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Edit Profile',
                          style: TextStyle(),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                        Text(
                          'Language & Currency',
                          style: TextStyle(),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                        Text(
                          'Feedback',
                          style: TextStyle(),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                        Text(
                          'Refer a Friend',
                          style: TextStyle(),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                        Text(
                          'Term & Conditions',
                          style: TextStyle(),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey[300],
                        ),
                        InkWell(
                          onTap: () {
                            showAlertDialog(context, provider);
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(color: Color(0xFF33907C)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
