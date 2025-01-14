import 'package:flutter/material.dart';

class AnimatedChild extends AnimatedWidget {
  final int? index;
  final Color? backgroundColor;
  final double elevation;
  final Widget? child;

  final bool visible;
  final VoidCallback? onTap;
  final VoidCallback? toggleChildren;
  final String? title;
  final String? subtitle;
  final Color? titleColor;
  final Color? subTitleColor;
  final Animation<double>? animation;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;

  AnimatedChild(
      {Key? key,
      this.animation,
      this.index,
      this.backgroundColor,
      this.elevation = 6.0,
      this.child,
      this.title,
      this.subtitle,
      this.visible = false,
      this.onTap,
      this.toggleChildren,
      this.titleColor,
      this.subTitleColor,
      this.titleTextStyle,
      this.subTitleTextStyle})
      : super(key: key, listenable: animation!);

  void _performAction() {
    if (onTap != null) onTap!();
    toggleChildren!();
  }

  Widget build(BuildContext context) {
    final Widget buttonChild = animation!.value > 50.0
        ? Container(
            width: animation!.value,
            height: animation!.value,
            padding: EdgeInsets.only(left: 5, right: 15.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: child ?? Container(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: titleTextStyle ??
                              TextStyle(
                                  color: (titleColor == null)
                                      ? Colors.black
                                      : titleColor,
                                  fontSize: 16.0),
                        ),
                        if (subtitle != null)
                          Text(
                            subtitle ?? '',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: subTitleTextStyle ??
                                TextStyle(
                                    color: (subTitleColor == null)
                                        ? Colors.black
                                        : subTitleColor,
                                    fontSize: 12.0),
                          )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        : Container();

    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: 75.0,
      padding: EdgeInsets.only(bottom: 65 - animation!.value),
      child: GestureDetector(
        onTap: _performAction,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          //width: animation.value,
          color: backgroundColor,
          child: buttonChild,
        ),
      ),
    );
  }
}
