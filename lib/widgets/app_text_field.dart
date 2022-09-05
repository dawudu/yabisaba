import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final IconData icon;
  bool isObscure;
  AppTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.icon,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.height20, right: Dimensions.height20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 3.0,
            spreadRadius: 1.0,
            offset: Offset(
              1.0, //
              1.0, //
            ),
          )
        ],
      ),
      child: TextField(
        obscureText: isObscure ? true : false,
        controller: textController,
        decoration: InputDecoration(
          //Hint Text
          hintText: hintText,
          //PrefixIcon
          prefixIcon: Icon(
            icon,
            color: AppColors.yellowColor,
          ),
          //FocusedBorder
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Dimensions.radius15,
              ),
              borderSide: BorderSide(
                width: 1.0,
                color: Colors.white,
              )),
          //EnabledBorder

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                Dimensions.radius15,
              ),
              borderSide: BorderSide(
                width: 1.0,
                color: Colors.white,
              )),
          //Border

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.radius15,
            ),
          ),
        ),
      ),
    );
  }
}
