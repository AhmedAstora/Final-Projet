import 'package:finalprojectflutter/Providers/add_product_provider.dart';
import 'package:finalprojectflutter/Screens/SearchScreen/search_screen.dart';
import 'package:finalprojectflutter/Widget/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchScreenStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Consumer<AddProductProvider>(
      builder: (context,provider,x) {
        return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Color(0xFF33907C),
                  title: TextFormField(
                      style: TextStyle(color: Colors.white),
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
                        hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
                      )),
                  bottom: AppBarsizeSearchStore(),
                ),
                body: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      mainAxisExtent: 228.h),
                  itemBuilder: (_, index) => ProductWidget(product: provider.ProductStore[index],),
                  itemCount: provider.ProductStore.length,
                ));
      }
    );
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
                RowSearch('Sort by', Icons.sort_rounded,0),
                RowSearch('Location', Icons.location_on_rounded,1),
                RowSearch('category', Icons.list,2),
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
