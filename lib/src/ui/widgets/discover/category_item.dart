import 'package:flutter/material.dart';
import 'package:toonder_comic/src/constants/color.global.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
      {Key? key,
      required this.name,
      this.active = false,
      required this.onTap,
      this.textStyle = const TextStyle(fontSize: 16)})
      : super(key: key);
  String name;
  late bool active;
  late TextStyle textStyle;
  late VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 30,
      decoration: BoxDecoration(
          gradient: active ? GlobalColors.categoryBgGradient : null,
          borderRadius: const BorderRadius.all(Radius.circular(100))),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent, shadowColor: Colors.transparent),
        child: Text(name, style: textStyle),
      ),
    );
  }
}
