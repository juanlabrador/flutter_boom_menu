library flutter_boom_menu;

import 'package:flutter/material.dart';

class BackgroundOverlay extends AnimatedWidget {
  final Color color;
  final double opacity;
  final Animation<double>? animation;

  BackgroundOverlay({
    Key? key,
    this.animation,
    this.color = Colors.white,
    this.opacity = 0.8,
  }) : super(key: key, listenable: animation!);

  Widget build(BuildContext context) {
    return Container(
      color: color.withOpacity(animation!.value * opacity),
    );
  }
}
