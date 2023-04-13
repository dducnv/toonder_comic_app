import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:toonder_comic/src/ui/widgets/carousel_custom.dart';
import 'package:toonder_comic/src/ui/widgets/home_carousel.dart';
import 'package:toonder_comic/src/ui/widgets/list_category_book.dart';
import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:flutter/material.dart';
import '../widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selected = 0;
  final PageController controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: GlobalColors.bgColor,
      appBar: const HomeAppBar(),
      drawer: Padding(
        padding: const EdgeInsets.only(bottom: 85, top: 25),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
          child: Drawer(
              backgroundColor: GlobalColors.bgColor,
              shadowColor: Colors.white,
              child: ListView(
                // padding: EdgeInsets.all(10),
                children: [
                  DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nguyen Van Duc",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      border: Border.all(color: Colors.red)),
                                  padding: const EdgeInsets.all(10),
                                  height: 80,
                                  child: Column(
                                    children: const [
                                      Text(
                                        "Số dư Xu",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      )
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      border: Border.all(color: Colors.red),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 80,
                                  child: Column(
                                    children: const [
                                      Text("Số dư Điểm",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white)),
                                    ],
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                  SidebarButton(
                    icon: Icons.rocket_launch_outlined,
                    title: "Nhiệm vụ nhận điểm",
                    onPress: () {},
                  ),
                  SidebarButton(
                    icon: Icons.card_membership_sharp,
                    title: "Hội viên",
                    onPress: () {},
                  ),
                  SidebarButton(
                    icon: Icons.money,
                    title: "nạp xu",
                    onPress: () {},
                  ),
                  SidebarButton(
                    icon: Icons.card_giftcard_outlined,
                    title: "Đổi Coupon",
                    onPress: () {},
                  ),
                  SidebarButton(
                    icon: Icons.stars_outlined,
                    title: "Gacha May Mắn",
                    onPress: () {},
                  ),
                  SidebarButton(
                    icon: Icons.settings_outlined,
                    title: "Cài đặt",
                    onPress: () {},
                  ),
                ],
              )),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CarouselCustom(),
            ListCategoryBook(),
            Container(
              clipBehavior: Clip.hardEdge,
              height: 44.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  gradient: GlobalColors.buttonBottomBarGradient),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: Text('Elevated Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  final IconData icon;
  final String title;
  VoidCallback onPress;

  SidebarButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      leading: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
      title: Text(title,
          style: const TextStyle(fontSize: 14, color: Colors.white)),
      onTap: onPress,
    );
  }
}
