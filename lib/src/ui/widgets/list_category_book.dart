import 'dart:math';

import 'package:toonder_comic/src/models/category.dart';
import 'package:toonder_comic/src/networks/network_request.dart';
import 'package:toonder_comic/src/ui/widgets/cetegory_item_list_view.dart';
import 'package:toonder_comic/src/ui/widgets/rank_list_view.dart';
import 'package:flutter/material.dart';

class ListCategoryBook extends StatefulWidget {
  const ListCategoryBook({Key? key}) : super(key: key);

  @override
  State<ListCategoryBook> createState() => _ListCategoryBookState();
}

class _ListCategoryBookState extends State<ListCategoryBook> {
  List<CategoryModel> categoryList = [];

  @override
  void initState() {
    NetworkRequest.fetchCategories().then((res) {
      setState(() {
        categoryList = res;
      });
    }).catchError((onError) {
      print(e.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryList.length,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, int index) {
        return categoryList[index].title == "Bảng xếp hạng"
            ? RankListView(categoryModel: categoryList[index])
            : CategoryItemListView(categoryModel: categoryList[index]);
      },
    );
  }
}
