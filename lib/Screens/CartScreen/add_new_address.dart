import 'package:finalprojectflutter/Providers/add_address_provider.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/custom_address_textfield.dart';
import 'package:finalprojectflutter/Widget/extend_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatelessWidget {
  @override
  Widget build(context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFF33907C)));
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Consumer<AddressProvider>(
              builder: (cnx, provider, x) {
                return Scaffold(
                  backgroundColor: Colors.grey[300],
                  appBar: AppBar(
                    centerTitle: true,
                    bottom: CustomAppBar(),
                    backgroundColor: Color(0xFF33907C),
                    title: Text(
                      'My Cart',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                          color: Colors.white),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          width: double.infinity,
                          height: 65.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                  )),
                              Text(
                                ' Use Current location',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 25.h),
                          child: Column(
                            children: [
                              CustomTextfieldAddress(
                                controller: provider.nameController,
                                labelText: 'Name',
                              ),
                              CustomTextfieldAddress(
                                textInputType: TextInputType.phone,
                                controller: provider.phoneController,
                                labelText: 'phone',
                              ),
                              CustomTextfieldAddress(
                                controller: provider.streetController,
                                labelText: 'Street address',
                              ),
                              CustomTextfieldAddress(
                                controller: provider.cityController,
                                labelText: 'City',
                              ),
                              CustomTextfieldAddress(
                                controller: provider.stateController,
                                labelText: 'state',
                              ),
                              CustomTextfieldAddress(
                                textInputType: TextInputType.number,
                                labelText: 'ZipCode',
                                controller: provider.zipCodeController,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 45.h),
                          color: Colors.white,
                          child: CustomButtoncart(
                            title: 'Save',
                            titleColor: Colors.white,
                            backgroudColor: Color(0xFF33907C),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ));
  }
}
