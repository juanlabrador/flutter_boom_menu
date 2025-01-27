import 'package:flutter/material.dart';

/// Provides data for a speed dial child
class MenuItem {
  final Widget? child;
  final Color? backgroundColor;
  final double elevation;
  final VoidCallback? onTap;
  final String? title;
  final String? subtitle;
  final Color? titleColor;
  final Color? subTitleColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;

  MenuItem(
      {this.child,
      @required this.title,
      this.subtitle,
      this.backgroundColor,
      this.elevation = 4,
      this.onTap,
      this.titleColor,
      this.subTitleColor,
      this.titleTextStyle,
      this.subTitleTextStyle});
}
