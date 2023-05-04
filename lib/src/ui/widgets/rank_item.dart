import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:toonder_comic/src/models/book.dart';

import 'package:toonder_comic/src/ui/widgets/book_item_row.dart';
import 'package:flutter/material.dart';

class RankItem extends StatelessWidget {
  InfoDatum? infoDatum;
  RankItem({Key? key, this.infoDatum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${infoDatum!.title}',
            style: TextStyle(
                color: GlobalColors.orangeColor,
                fontSize: 14,
                fontWeight: FontWeight.w400)),
        const SizedBox(
          height: 10,
        ),
        for (int i = 0; i < infoDatum!.data!.length; i++)
          Column(
            children: [
              BookItemRow(bookModel: infoDatum!.data![i], index: i + 1),
              const SizedBox(
                height: 10,
              )
            ],
          )
      ],
    );
  }
}
