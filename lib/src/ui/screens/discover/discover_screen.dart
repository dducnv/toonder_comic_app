import 'package:flutter/material.dart';
import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:toonder_comic/src/ui/screens/discover/category_tab_item.dart';
import 'package:toonder_comic/src/ui/screens/discover/rank_tab_item.dart';
import 'package:toonder_comic/src/ui/screens/discover/release_schedule_tab_item.dart';
import 'package:toonder_comic/src/ui/widgets/discover/book_item.dart';
import 'package:toonder_comic/src/ui/widgets/discover/category_item.dart';
import 'package:toonder_comic/src/ui/widgets/discover/sort_dropdown.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: GlobalColors.bgColor,
          appBar: AppBar(
            backgroundColor: GlobalColors.bgColor,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Khám phá',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  titleSpacing: 0,
                  collapsedHeight: kToolbarHeight,
                  backgroundColor: GlobalColors.bgColor,
                  bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(0),
                      child: TabBar(
                        indicatorColor: GlobalColors.orangeColor,
                        tabs: const [
                          Tab(child: Text('Xếp hạng')),
                          Tab(child: Text('Thể loại')),
                          Tab(child: Text('Lịch ra mắt')),
                        ],
                      ))),
            ],
            body: const TabBarView(
              children: <Widget>[
                RankTabItem(),
                CategoryTabItem(),
                ReleaseScheduleTabItem()
              ],
            ),
          ),
        ),
      ), //Scaffold
      debugShowCheckedModeBanner: false,
      // Remove debug banner for proper
      // view of setting icon
    ); //MaterialApp
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
