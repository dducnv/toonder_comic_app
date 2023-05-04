import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toonder_comic/src/blocs/book_bloc/book_event.dart';
import 'package:toonder_comic/src/blocs/book_bloc/book_state.dart';
import 'package:toonder_comic/src/resources/api_repository.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetBookList>((event, emit) async {
      emit(BookLoading());
      final bookList = await _apiRepository.fetchBook();
      if (bookList.responsecode! < 0) {
        emit(BookError(bookList.description));
      } else {
        emit(BookLoaded(bookList));
      }
    });
  }
}
