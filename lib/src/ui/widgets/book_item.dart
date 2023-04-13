import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:toonder_comic/src/models/book.dart';
import 'package:flutter/material.dart';
import 'package:progressive_image/progressive_image.dart';

class BookItem extends StatelessWidget {
  BookModel? bookModel;

  BookItem({required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ProgressiveImage(
              placeholder: const AssetImage('assets/images/logo.png'),
              // size: 1.87KB
              thumbnail: NetworkImage('${bookModel!.imgUrl}'),
              // size: 1.29MB
              image: NetworkImage('${bookModel!.imgUrl}'),
              height: 150,
              fit: BoxFit.cover, width: double.infinity,
            ),
          ),
          const SizedBox(height: 5),
          Text('${bookModel!.bookName}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                  gradient: GlobalColors.categoryBgGradient,
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
              child: Text('${bookModel!.categoryList}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500)),
            ),
          )
        ],
      ),
    );
  }
}
