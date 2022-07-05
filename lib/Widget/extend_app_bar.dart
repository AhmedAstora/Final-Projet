import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
              width: double.infinity,
              color: Color(0xFF33907C),
            );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(36.h);
}
