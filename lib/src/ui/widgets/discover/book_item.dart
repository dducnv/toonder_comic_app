import 'package:flutter/material.dart';
import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:toonder_comic/src/models/book.dart';
import 'package:toonder_comic/src/models/discover_model.dart';

class BookItem extends StatelessWidget {
  BookByCategory? bookModel;
  int index;
  BookItem({Key? key, required this.bookModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        height: 120,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: GlobalColors.bottomAppBarBgColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(bookModel!.imgUrl.toString()),
                          fit: BoxFit.cover),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10)),
                    child: Container(
                      height: 25,
                      width: 25,
                      color: Colors.black.withOpacity(0.8),
                      child: Center(
                        child: Text(
                          index.toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      height: 25,
                      decoration: BoxDecoration(
                          gradient: GlobalColors.categoryBgGradient,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100))),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent),
                        child: Text(bookModel!.categoryList.toString(),
                            style: TextStyle(fontSize: 10)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      bookModel!.bookName.toString(),
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      bookModel!.authorName.toString(),
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.grey,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              bookModel!.viewNo.toString(),
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                              size: 16,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              bookModel!.likeNo.toString(),
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
