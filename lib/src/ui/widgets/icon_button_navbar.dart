import 'package:flutter/material.dart';

import 'package:toonder_comic/src/constants/color.global.dart';

class IconButtonNavBar extends StatelessWidget {
  final bool active;
  final Widget icon;
  const IconButtonNavBar({Key? key, required this.active, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: !active ? GlobalColors.bgColor : null,
            gradient: active ? GlobalColors.buttonBottomBarGradient : null,
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: icon);
  }
}
