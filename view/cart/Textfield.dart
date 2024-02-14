


import 'package:ecommerce_app/utils/color_utils.dart';
import 'package:flutter/material.dart';


class DefaultTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final keyboardType, obscureText;
  const DefaultTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const kDefaultPadding = 24.0;const kShape = 30.0;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kShape)),
        color: AppColors.accentColor,
      ),
      child: TextField(
        cursorColor: AppColors.primaryColor,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(icon, color: AppColors.primaryColor),
          hintText: hintText,
        ),
      ),
    );
  }
}
