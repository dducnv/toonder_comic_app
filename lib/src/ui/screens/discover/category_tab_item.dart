import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toonder_comic/src/blocs/book_discover/book_discover_bloc.dart';
import 'package:toonder_comic/src/blocs/book_discover/book_discover_event.dart';
import 'package:toonder_comic/src/blocs/book_discover/book_discover_state.dart';
import 'package:toonder_comic/src/blocs/cetegory_bloc/category_bloc.dart';
import 'package:toonder_comic/src/blocs/cetegory_bloc/category_event.dart';
import 'package:toonder_comic/src/blocs/cetegory_bloc/category_state.dart';
import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:toonder_comic/src/models/category.dart';
import 'package:toonder_comic/src/ui/widgets/discover/book_item.dart';
import 'package:toonder_comic/src/ui/widgets/discover/category_item.dart';
import 'package:toonder_comic/src/ui/widgets/discover/sort_dropdown.dart';

class CategoryTabItem extends StatefulWidget {
  const CategoryTabItem({Key? key}) : super(key: key);

  @override
  State<CategoryTabItem> createState() => _CategoryTabItemState();
}

class _CategoryTabItemState extends State<CategoryTabItem> {
  final CategoryBloc _categoryBloc = CategoryBloc();
  final BookDiscoverBloc _bookBloc = BookDiscoverBloc();
  final PageController _pageController = PageController();
  final itemKey = GlobalKey();
  final scrollController = ScrollController();
  int _selectedIndex = 3;
  int _sortIndex = 1;
  CategoryModel _categoryModel = CategoryModel();
  @override
  void initState() {
    _categoryBloc.add(GetCategoryList());
    _bookBloc.add(GetBookByCategory(_selectedIndex, 1));
    super.initState();
  }

  void _onFilterPostByCategory() {
    _bookBloc.add(GetBookByCategory(_selectedIndex, 1));
  }

  void scrollToItem() {
    final keyContext = itemKey.currentContext;
    if (keyContext != null) {
      final box = keyContext.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero);
      scrollController.animateTo(position.dy,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> itemDropdownFilter = [];
    itemDropdownFilter.add({'name': 'Lượt xem', 'value': 1});
    itemDropdownFilter.add({'name': 'Lượt like', 'value': 2});
    itemDropdownFilter.add({'name': 'Mới cập nhật', 'value': 3});
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (BuildContext context) => _categoryBloc,
        ),
        BlocProvider<BookDiscoverBloc>(
          create: (BuildContext context) => _bookBloc,
        ),
      ],
      child: BlocBuilder<CategoryBloc, CategoryState>(
        buildWhen: (previous, current) {
          return current is CategoryLoaded;
        },
        builder: (context, state) {
          if (state is CategoryLoaded) {
            _categoryModel = state.categoryModel;

            return PageView(
                pageSnapping: false,
                clipBehavior: Clip.none,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [
                  Column(children: [
                    Container(
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
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                                height: 50,
                                child: ListView.builder(
                                    controller: scrollController,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: _categoryModel.info!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        CategoryItem(
                                          key: ValueKey("category_item_$index"),
                                          textStyle: TextStyle(
                                              color: _categoryModel.info![index]
                                                          .categoryId! ==
                                                      _selectedIndex
                                                  ? Colors.white
                                                  : GlobalColors.grayColor),
                                          onTap: () {
                                            setState(() {
                                              _selectedIndex = _categoryModel
                                                  .info![index].categoryId!;
                                            });
                                            _onFilterPostByCategory();
                                          },
                                          name: _categoryModel
                                              .info![index].categoryName!,
                                          active: _selectedIndex ==
                                              _categoryModel
                                                  .info![index].categoryId!,
                                        ))),
                          ),
                          Container(
                            clipBehavior: Clip.hardEdge,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: GlobalColors.nonActiveColor
                                    .withOpacity(0.6)),
                            child: ElevatedButton(
                                onPressed: () {
                                  _pageController.nextPage(
                                      duration: const Duration(milliseconds: 1),
                                      curve: Curves.easeIn);
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                child: SvgPicture.asset(
                                  "assets/icons/arrow_bottom.svg",
                                )),
                          )
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
                              _sortIndex = value;
                            });
                            _onFilterPostByCategory();
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: BlocBuilder<BookDiscoverBloc, BookDiscoverState>(
                          builder: (context, state) {
                        if (state is BookLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
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
                        return const SizedBox();
                      }),
                    )
                  ]),
                  Column(
                    children: [
                      Container(
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                    child: Text(
                                  "Danh sách thể loại",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: GlobalColors.grayColor),
                                )),
                              ),
                              Container(
                                clipBehavior: Clip.hardEdge,
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: GlobalColors.nonActiveColor
                                        .withOpacity(0.6)),
                                child: ElevatedButton(
                                    onPressed: () {
                                      _pageController.previousPage(
                                          duration:
                                              const Duration(milliseconds: 1),
                                          curve: Curves.easeIn);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        shadowColor: Colors.transparent),
                                    child: SvgPicture.asset(
                                      "assets/icons/arrow-up.svg",
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 100,
                                      childAspectRatio: 0.9,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5),
                              itemCount: _categoryModel.info!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return TextButton(
                                  onPressed: () {
                                    _pageController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 1),
                                        curve: Curves.easeIn);
                                    setState(() {
                                      _selectedIndex = _categoryModel
                                          .info![index].categoryId!;
                                    });
                                    _onFilterPostByCategory();
                                  },
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Image.network(
                                              _categoryModel
                                                  .info![index].iconLink!,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Text(
                                        _categoryModel
                                            .info![index].categoryName!,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: GlobalColors.grayColor),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  )
                ]);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
