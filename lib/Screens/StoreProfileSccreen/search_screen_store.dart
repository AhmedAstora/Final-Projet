import 'package:finalprojectflutter/Screens/SearchScreen/search_screen.dart';
import 'package:finalprojectflutter/Widget/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreenStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xFF33907C),
              title: TextFormField(
                  style: TextStyle(color: Colors.grey[700]),
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    suffixIcon: Image.asset(
                      'assets/images/search.png',
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white)),
                    errorStyle: TextStyle(fontSize: 14.sp),
                    fillColor: Color(0xFF33907C),
                    filled: true,
                    hintText: 'Search Product',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  )),
              bottom: AppBarsizeSearchStore(),
            ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  mainAxisExtent: 228.h),
              itemBuilder: (_, index) => ProductWidget(),
              itemCount: 18,
            )));
  }
}

class AppBarsizeSearchStore extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45.h,
        color: const Color(0xFF33907C),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RowSearch('Sort by', Icons.sort_rounded),
                RowSearch('Location', Icons.location_on_rounded),
                RowSearch('category', Icons.list),
              ],
            )
          ],
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(80.h);
  }
}
