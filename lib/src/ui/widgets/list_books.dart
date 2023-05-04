import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toonder_comic/src/blocs/book_bloc/book_bloc.dart';
import 'package:toonder_comic/src/blocs/book_bloc/book_event.dart';
import 'package:toonder_comic/src/blocs/book_bloc/book_state.dart';
import 'package:toonder_comic/src/models/book.dart';
import 'package:toonder_comic/src/ui/widgets/cetegory_item_list_view.dart';
import 'package:toonder_comic/src/ui/widgets/rank_list_view.dart';

class ListBooks extends StatefulWidget {
  const ListBooks({Key? key}) : super(key: key);

  @override
  State<ListBooks> createState() => _ListBooksState();
}

class _ListBooksState extends State<ListBooks> {
  final BookBloc _bookBloc = BookBloc();
  @override
  void initState() {
    _bookBloc.add(GetBookList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bookBloc,
      child: BlocConsumer<BookBloc, BookState>(
        buildWhen: (previous, current) {
          return current is BookError || current is BookLoaded;
        },
        listenWhen: (previous, current) {
          return current is BookError || current is BookLoaded;
        },
        listener: (context, state) {
          if (state is BookError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message!)));
          }
        },
        builder: (context, state) {
          if (state is BookLoaded) {
            BookModel books = state.books;
            return ListView.builder(
              itemCount: books.info!.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, int index) {
                return books.info![index].title == "Bảng xếp hạng"
                    ? RankListView(bookModel: books.info![index])
                    : CategoryItemListView(bookModel: books.info![index]);
              },
            );
          } else {
            return _buildLoading();
          }
        },
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}


// BlocListener<BookBloc, BookState>(listener: (context, state) {
//         if (state is BookError) {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text(state.message!)));
//         }
//         if(state is BookLoading) {
//           _buildLoading();
//         }

//       }
//       , child: BlocBuilder<BookBloc, BookState>(
//         builder: (context, state) {
//           if (state is BookInitial) {
//             return _buildLoading();
//           } else if (state is BookLoading) {
//             return _buildLoading();
//           } else if (state is BookLoaded) {
//             BookModel books = state.books;
//             return ListView.builder(
//               itemCount: books.info!.length,
//               physics: const BouncingScrollPhysics(),
//               padding: EdgeInsets.zero,
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               itemBuilder: (context, int index) {
//                 return books.info![index].title == "Bảng xếp hạng"
//                     ? RankListView(bookModel: books.info![index])
//                     : CategoryItemListView(bookModel: books.info![index]);
//               },
//             );
//           } else if (state is BookError) {
//             return Center(child: Text(state.message!));
//           } else {
//             return const Center(
//               child: Text("Error load data"),
//             );
//           }
//         },
//       )),