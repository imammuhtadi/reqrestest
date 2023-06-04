import 'package:flutter/material.dart';
import 'package:netwerktest/theme/app_font.dart';

class Label extends StatelessWidget {
  final String text;
  final bool isRequired;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const Label({
    super.key,
    required this.text,
    this.isRequired = false,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Row(
        children: [
          Text(text),
          if (isRequired)
            Text(' *', style: textSmall.copyWith(color: Colors.red)),
        ],
      ),
    );
  }
}
