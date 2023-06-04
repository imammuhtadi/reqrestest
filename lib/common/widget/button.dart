import 'package:flutter/material.dart';
import 'package:netwerktest/theme/app_color.dart';
import 'package:netwerktest/theme/enum/app_style.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isLoading;
  final bool disable;
  final bool visible;
  final AppStyle style;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const Button({
    super.key,
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.disable = false,
    this.visible = true,
    this.style = AppStyle.primary,
    this.margin,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return visible
        ? Container(
            width: double.maxFinite,
            margin: margin,
            child: MaterialButton(
              elevation: 0,
              padding: padding,
              onPressed: disable
                  ? null
                  : isLoading
                      ? () {}
                      : onPressed,
              disabledColor: AppColor.greyLight,
              color: disable
                  ? AppColor.greyLight
                  : style == AppStyle.primary
                      ? AppColor.primary
                      : Colors.white,
              textColor: disable
                  ? AppColor.grey
                  : style == AppStyle.primary
                      ? Colors.white
                      : AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  width: 1,
                  color: disable ? AppColor.greyLight : AppColor.primary,
                ),
              ),
              child: isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: style == AppStyle.primary
                            ? Colors.white
                            : AppColor.primary,
                      ),
                    )
                  : Text(
                      label,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          )
        : Container();
  }
}
