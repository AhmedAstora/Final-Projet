import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'create_new_store.dart';

class EmptyStoreBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(
        children: [
          Container(
            color: Color(0xFF33907C),
            width: double.infinity,
            height: 30.h,
          ),
          Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Image(
                image: AssetImage('assets/images/store.png'),
              ),
              SizedBox(
                height: 25.h,
              ),
              Text('You Don\'t Have a Store ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
              SizedBox(
                height: 50.h,
              ),
              InkWell(
                onTap: (){
                  RouterClass.routerClass.pushToSpecificScreenUsingWidget('/CreateNewStore');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 70.w),
                  child: CustomButtoncart(
                    title: 'Create Store',
                    titleColor: Colors.white,
                    backgroudColor: Color(0xFF33907C),
                  ),
                ),
              ),
            ],
          )
        ],

    );
  }
}
