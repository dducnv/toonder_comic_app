import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:toonder_comic/src/constants/media.global.dart';
import 'package:toonder_comic/src/constants/variable.global.dart';
import 'package:toonder_comic/src/ui/widgets/button_navbar.dart';
import 'package:flutter/material.dart';
import 'package:toonder_comic/src/ui/screens/home_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  int _selected = 0;
  final PageController controller = PageController(initialPage: 0);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: GlobalColors.bgColor,
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(VariableGlobal.bottomBarRadius),
              topRight: Radius.circular(VariableGlobal.bottomBarRadius),
            ),
            child: Container(
              color: Colors.transparent,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: GlobalColors.nonActiveColor,
                backgroundColor: GlobalColors.bottomAppBarBgColor,
                iconSize: 24,
                currentIndex: _selected,
                onTap: (value) {
                  controller.jumpToPage(value);
                  setState(() {
                    _selected = value;
                  });
                },
                items: <BottomNavigationBarItem>[
                  buttonNavBar(
                      MediaGlobal.homeIcon, "Trang chủ", _selected == 0),
                  buttonNavBar(
                      MediaGlobal.discoverIcon, "Khám phá", _selected == 1),
                  buttonNavBar(
                      MediaGlobal.hotIcon, "Có gì HOT", _selected == 2),
                  buttonNavBar(MediaGlobal.bookIcon, "Tủ sách", _selected == 3),
                  buttonNavBar(
                      MediaGlobal.personIcon, "Của tôi", _selected == 4),
                ],
              ),
            ),
          ),
          body: PageView(
            // physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                _selected = index;
              });
            },
            //  physics: const NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              Center(
                child: Text("Page 2"),
              ),
              Center(
                child: Text("Page 3"),
              ),
              Center(
                child: Text("Page 4"),
              ),
              Center(
                child: Text("Page 5"),
              ),
            ],
          ),
        ));
  }
}
