import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class GlobalTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool boldRequired;
  final Color? color;
  const GlobalTextWidget({
    required this.text,
    this.boldRequired = false,
    super.key,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: color ?? ThemeConstants.black,
          fontSize: fontSize ?? 16,
          fontWeight: boldRequired ? FontWeight.w600 : FontWeight.normal),
    );
  }
}
