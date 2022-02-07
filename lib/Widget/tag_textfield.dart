import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textfield_tags/textfield_tags.dart';

class TagTextfield extends StatelessWidget {
  String Title;

  TagTextfield(this.Title);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: Size(393, 851),
        minTextAdapt: true,
        builder: () => TextFieldTags(
                textSeparators: <String>[
                  //text tag seperators
                  //Default = " ", ","
                ],
                textFieldStyler: TextFieldStyler(
                  //These are properties you can tweek for customization

                  // bool textFieldFilled = false,
                  // Icon icon,
                  helperText: '$Title (Optional)',
                  // TextStyle helperStyle,
                  hintText: '   $Title',
                  hintStyle: TextStyle(fontSize: 14.sp),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                  textFieldBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey)),

                  // Color textFieldFilledColor,
                  // bool isDense = true,
                  // bool textFieldEnabled = true,
                  // OutlineInputBorder textFieldBorder = const OutlineInputBorder(),
                  textFieldFocusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400])),
                  // OutlineInputBorder textFieldDisabledBorder,
                  // OutlineInputBorder textFieldEnabledBorder
                ),
                tagsStyler: TagsStyler(
                    //These are properties you can tweek for customization

                    // showHashtag = false,
                    tagPadding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    // EdgeInsets tagMargin = const EdgeInsets.symmetric(horizontal: 4.0),
                    tagDecoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15)),
                    // TextStyle tagTextStyle,
                    tagCancelIcon:
                        Icon(Icons.cancel, size: 18.0, color: Colors.grey)),
                onTag: (tag) {
                  //This give you the tag that was entered
                  //print(tag)
                },
                onDelete: (tag) {
                  //This gives you the tag that was deleted
                  //print(tag)
                },
                validator: (tag) {
                  if (tag.length > 15) {
                    return "hey that's too long";
                  }
                  return null;
                }
                //tagsDistanceFromBorderEnd: 0.725,
                //scrollableTagsMargin: EdgeInsets.only(left: 9),
                //scrollableTagsPadding: EdgeInsets.only(left: 9),
                ));
  }
}
