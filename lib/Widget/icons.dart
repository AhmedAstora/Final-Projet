import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconsWidget extends StatelessWidget {

  IconData iconData;
  IconsWidget(this.iconData);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 32.w,
      height: 32.h,
        decoration: BoxDecoration(
          color: Colors.grey[500].withOpacity(0.7),
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          iconData,color: Colors.white,size: 22,
        ));
  }
}
