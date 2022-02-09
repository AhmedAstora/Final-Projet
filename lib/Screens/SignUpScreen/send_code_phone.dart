import 'package:finalprojectflutter/Providers/authProvider.dart';
import 'package:finalprojectflutter/Widget/button.dart';
import 'package:finalprojectflutter/Widget/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SendPhoneCode extends StatelessWidget {
  List<String> data = ['+970', '+972'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF33907C),
      body: Column(
        children: [
          SizedBox(
            height: 200.h,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Verify your phone number',
              style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Enter Number to ',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          Text(
            'We have sent you an SMS with a code',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Consumer<AuthProvider>(
            builder: (cnx, provider, x) {
              return Form(
                key: provider.PhoneFormKey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                        child: DropdownButton<String>(
                          iconEnabledColor: Colors.white,
                          underline: Text(''),
                          alignment: Alignment.center,
                          hint: provider.value == null
                              ? const Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              : Text(
                                  provider.value,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                          items: data.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            provider.value = value;
                            provider.notifyListeners();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: provider.PhoneloginPasswordController,
                            maxLength: 9,
                            validator: provider.phoneValidation,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide(color: Color(0xFF33907C))),
                              focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide(color: Color(0xFF33907C))),
                              errorStyle: TextStyle(fontSize: 14.sp),
                              counterText: '',
                              hintText: 'Enter Phone Number ',
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.normal),
                            )),
                        width: 200.w,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 70.h,
          ),
          InkWell(
            onTap: () {
              if (Provider.of<AuthProvider>(context, listen: false)
                  .PhoneValidate()) {
                Provider.of<AuthProvider>(context, listen: false)
                    .RegisterPhone();
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: CustomButton(
                title: 'Send Code',
                titleColor: Color(0xFF33907C),
                backgroudColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
