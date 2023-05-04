import 'package:flutter/material.dart';
import 'package:toonder_comic/src/constants/color.global.dart';

class SortDropDown extends StatelessWidget {
  Function? onTap;
  List<dynamic> items;
  SortDropDown({super.key, this.onTap, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Theme(
        data: ThemeData(
          cardColor: GlobalColors.bgColor,
          popupMenuTheme: PopupMenuThemeData(
            textStyle: TextStyle(color: Colors.white),
            color: GlobalColors.bgColor,
          ),
        ),
        child: PopupMenuButton(
          offset: const Offset(1, 30),
          child: SizedBox(
            width: 70,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: const Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.white,
                  )),
              const Text('Bộ lọc', style: TextStyle(color: Colors.white))
            ]),
          ),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            for (int i = 0; i < items.length; i++)
              PopupMenuItem(
                onTap: () {
                  onTap!(items[i]['value']);
                },
                height: 25,
                child: Text(items[i]['name']),
              ),
          ],
        ),
      ),
    );
  }
}
