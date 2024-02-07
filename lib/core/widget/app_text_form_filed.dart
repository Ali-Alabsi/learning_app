import 'package:flutter/material.dart';
import '../shared/color.dart';
import '../shared/theming/text_style.dart';

class AppTextFormFiled extends StatelessWidget {
  const AppTextFormFiled(
      {super.key,
      this.contentPadding,
      required this.hintText,
      this.hintStyle,
      this.enabledBorder,
      this.focusedBorder,
      this.fillColor,
      this.suffixIcon,
        this.prefixIcon,
        this.keyboardType,
        this.obscureText});

  final EdgeInsetsGeometry? contentPadding;
  final String hintText;
  final TextStyle? hintStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType?? TextInputType.text ,
      obscureText: obscureText??false,
      decoration: InputDecoration(
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          hintText: hintText,
           hintStyle: hintStyle,
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ProjectColors.greyColor,
                  ),
                  borderRadius: BorderRadius.circular(16)),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ProjectColors.mainColor,
                  ),
                  borderRadius: BorderRadius.circular(16)),
          fillColor: fillColor ?? ProjectColors.mainColor.withOpacity(0.2),
          filled: true,
          suffixIcon: suffixIcon,
        prefixIcon: prefixIcon
      ),

    );
  }
}
