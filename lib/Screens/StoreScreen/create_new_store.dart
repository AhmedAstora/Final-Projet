import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/CartScreen/cartscreen.dart';
import 'package:finalprojectflutter/Screens/Product%20Details/productdetails.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/custom_address_textfield.dart';
import 'package:finalprojectflutter/Widget/tag_textfield.dart';
import 'package:finalprojectflutter/Widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateNewStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFF33907C)));
    // TODO: implement build
    return  Consumer<AuthProvider>(
              builder: (cnx, provider, x) {
                return Scaffold(
                  backgroundColor: Color(0xFFF6F9FF),
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
                          Text(
                            'This information is used to set up',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          Text(
                            'your shop',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25.w,
                            ),
                            color: Colors.white,
                            child: SingleChildScrollView(
                              child: Form(
                                key: provider.CreatStoreFormKey,
                                child: Column(
                                  children: [
                                    CustomTextfieldAddress(
                                      controller: provider.namestoreController,
                                      labelText: 'Store Name',
                                      validationFun: provider.nullValidator,
                                    ),
                                    CustomTextfieldAddress(
                                      controller: provider.webstoreController,
                                      maxlength: 50,
                                      labelText: 'Store Web Address',
                                      validationFun: provider.nullValidator,

                                    ),
                                    CustomTextfieldAddress(
                                      controller: provider.DesstoreController,
                                      maxlength: 100,
                                      labelText: 'Store Description',
                                      validationFun: provider.nullValidator,

                                    ),
                                    CustomTextfieldAddress(
                                      controller: provider.typestoreController,
                                      maxlength: 20,
                                      labelText: 'Store Type',
                                      validationFun: provider.nullValidator,

                                    ),
                                    CustomTextfieldAddress(
                                      controller: provider.addressstoreController,
                                      maxlength: 50,
                                      labelText: 'Address',
                                      validationFun: provider.nullValidator,

                                    ),
                                    CustomTextfieldAddress(
                                      controller: provider.CitystoreController,
                                      maxlength: 10,
                                      labelText: 'City',
                                    ),
                                    CustomTextfieldAddress(
                                      controller: provider.statestoreController,
                                      maxlength: 15,
                                      labelText: 'State',
                                    ),
                                    CustomTextfieldAddress(
                                      controller: provider.courierstoreController,
                                      maxlength: 20,
                                      labelText: 'Courier Name',
                                      validationFun: provider.nullValidator,

                                    ),
                                    TagTextfield(
                                      Title: 'Tageline',
                                      provider: provider.taglinetoreController,

                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    InkWell(
                                      onTap: (){
                                       if(provider.CreatStoreValidate()){
                                         provider.editUser();
                                       }

                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 20.h, bottom: 30.h),
                                        color: Colors.white,
                                        child: CustomButtoncart(
                                          title: 'Create',
                                          titleColor: Colors.white,
                                          backgroudColor: Color(0xFF33907C),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
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
