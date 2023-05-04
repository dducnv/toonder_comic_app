import 'package:carousel_slider/carousel_slider.dart';
import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:toonder_comic/src/models/book.dart';
import 'package:toonder_comic/src/ui/widgets/rank_item.dart';
import 'package:flutter/material.dart';

class RankListView extends StatelessWidget {
  Info bookModel;

  RankListView({Key? key, required this.bookModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 1.8 / 2);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(bookModel.title.toString(),
                  style: TextStyle(
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
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView.builder(
              controller: controller,
              padEnds: false,
              physics: BouncingScrollPhysics(),
              itemCount: bookModel.data!.length,
              itemBuilder: (context, index) {
                return RankItem(
                  infoDatum: bookModel.data![index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
