import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.all(11),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: GlobalColors.bgColor.withOpacity(0.5),
        ),
        child: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              size: 16.0,
            )),
      ),
      actions: [
        Container(
          width: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: GlobalColors.bgColor.withOpacity(0.5),
          ),
          child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
              icon: const Icon(Icons.search_outlined, size: 16.0)),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: GlobalColors.bgColor.withOpacity(0.5),
          ),
          child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined, size: 16.0)),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
