import 'package:flutter/material.dart';
import 'package:netwerktest/theme/app_color.dart';
import 'package:netwerktest/theme/app_font.dart';

class Edittext extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final TextInputType? inputType;
  final String? hint;
  final int maxLines;
  final bool enabled;
  final bool obscureText;
  final EdgeInsetsGeometry? margin;
  final Widget? suffix;
  final Widget? prefix;

  const Edittext({
    super.key,
    this.controller,
    this.onTap,
    this.inputType,
    this.hint,
    this.maxLines = 1,
    this.enabled = true,
    this.obscureText = false,
    this.margin,
    this.suffix,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        onTap: onTap,
        child: TextFormField(
          controller: controller,
          enabled: enabled,
          obscureText: obscureText,
          keyboardType: inputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefix,
            suffixIcon: suffix,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 45,
            ),
            hintStyle: textRegular.copyWith(color: AppColor.grey),
            contentPadding: EdgeInsets.only(
              left: 16.0,
              right: suffix != null ? 8 : 16.0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(width: 1.5, color: AppColor.greyLight),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(width: 1.5, color: AppColor.greyLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(width: 1.5, color: AppColor.greyLight),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(width: 1.5, color: AppColor.greyLight),
            ),
            filled: true,
            fillColor:
                enabled || onTap != null ? Colors.white : AppColor.greyLight,
          ),
        ),
      ),
    );
  }
}
