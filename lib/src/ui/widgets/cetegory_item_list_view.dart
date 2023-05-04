import 'dart:convert';

import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:flutter/material.dart';
import 'package:toonder_comic/src/models/book.dart';

import 'package:toonder_comic/src/ui/widgets/book_item.dart';

class CategoryItemListView extends StatelessWidget {
  Info bookModel;

  CategoryItemListView({Key? key, required this.bookModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${bookModel.title}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              TextButton(
                  onPressed: () {},
                  child: Text('Tất cả >',
                      style: TextStyle(
                          color: GlobalColors.orangeColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)))
            ],
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: bookModel.data?.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    BookItem(bookModel: bookModel.data![index]),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
