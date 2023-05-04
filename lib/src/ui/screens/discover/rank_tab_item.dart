import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toonder_comic/src/blocs/book_discover/book_discover_bloc.dart';
import 'package:toonder_comic/src/blocs/book_discover/book_discover_event.dart';
import 'package:toonder_comic/src/blocs/book_discover/book_discover_state.dart';
import 'package:toonder_comic/src/ui/widgets/discover/book_item.dart';
import 'package:toonder_comic/src/ui/widgets/discover/category_item.dart';
import 'package:toonder_comic/src/ui/widgets/discover/sort_dropdown.dart';

class RankTabItem extends StatefulWidget {
  const RankTabItem({Key? key}) : super(key: key);

  @override
  State<RankTabItem> createState() => _RankTabItemState();
}

class _RankTabItemState extends State<RankTabItem> {
  int _menuSelect = 1;
  int _sortDropdownMenu = 1;
  final BookDiscoverBloc _bookDiscoverBloc = BookDiscoverBloc();

  @override
  void initState() {
    _bookDiscoverBloc.add(GetBookRank(_menuSelect, _sortDropdownMenu));
    super.initState();
  }

  void handleSelectMenu() {
    _bookDiscoverBloc.add(GetBookRank(_menuSelect, _sortDropdownMenu));
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> itemDropdownFilter = [];
    itemDropdownFilter.add({'name': 'Tháng này', 'value': 1});
    itemDropdownFilter.add({'name': 'Tháng trước', 'value': 2});

    List<dynamic> itemMenu = [];
    itemMenu.add({'name': 'Top View', 'value': 1});
    itemMenu.add({'name': 'Top Like', 'value': 2});
    itemMenu.add({'name': 'Chuyện Mới', 'value': 3});
    itemMenu.add({'name': 'Chuyện Full', 'value': 4});
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 2),
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                ),
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                ))),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemMenu.length,
                itemBuilder: (context, index) => CategoryItem(
                  name: itemMenu[index]['name'],
                  active: itemMenu[index]['value'] == _menuSelect,
                  onTap: () {
                    setState(() {
                      _menuSelect = itemMenu[index]['value'];
                    });
                    handleSelectMenu();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SortDropDown(
              items: itemDropdownFilter,
              onTap: (value) {
                setState(() {
                  _sortDropdownMenu = value;
                });
                handleSelectMenu();
              }),
        ],
      ),
      Expanded(
        child: BlocProvider(
          create: (context) => _bookDiscoverBloc,
          child: BlocBuilder<BookDiscoverBloc, BookDiscoverState>(
            builder: (_, state) {
              if (state is BookLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is BookLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: state.books.info!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => BookItem(
                      bookModel: state.books.info![index],
                      index: index + 1,
                    ),
                  ),
                );
              }
              return const Center(child: Text("Error"));
            },
          ),
        ),
      ),
    ]);
  }
}
