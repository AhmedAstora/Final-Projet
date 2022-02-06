import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/CartScreen/cartscreen.dart';
import 'package:finalprojectflutter/Screens/Product%20Details/productdetails.dart';
import 'package:finalprojectflutter/Widget/custom_address_textfield.dart';
import 'package:finalprojectflutter/Widget/tag_textfield.dart';
import 'package:finalprojectflutter/Widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFF33907C)));
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Scaffold(
              appBar: AppBar(
                title: Text(
                  'Create Store',
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
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w,),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Image(
                          image: AssetImage('assets/images/store.png'),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text('This information is used to set up',style: TextStyle(fontSize: 14.sp),),
                      Text('your shop',style: TextStyle(fontSize: 14.sp),),
                      SizedBox(height: 30.h,),
                      CustomTextfieldAddress(
                        labelText: 'Store Name',
                      ),
                      CustomTextfieldAddress(
                        labelText: 'Store Web Address',
                      ),
                      CustomTextfieldAddress(
                        labelText: 'Store Description',
                      ),
                      CustomTextfieldAddress(
                        labelText: 'Store Type',
                      ),
                      CustomTextfieldAddress(
                        labelText: 'Address',
                      ),
                      CustomTextfieldAddress(
                        labelText: 'City',
                      ),
                      CustomTextfieldAddress(
                        labelText: 'State',
                      ),
                      CustomTextfieldAddress(
                        labelText: 'Courier Name',
                      ),

                      TagTextfield(),
                      SizedBox(height: 20.h,)


                    ],
                  ),
                ),
              ),
            ));
  }
}

class AppBarsizeStore extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF33907C),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(20.h);
  }
}
