import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toonder_comic/src/blocs/book_discover/book_discover_event.dart';
import 'package:toonder_comic/src/blocs/book_discover/book_discover_state.dart';

import 'package:toonder_comic/src/resources/api_repository.dart';

class BookDiscoverBloc extends Bloc<BookDiscoverEvent, BookDiscoverState> {
  BookDiscoverBloc() : super(BookInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetBookByCategory>((event, emit) async {
      emit(BookLoading());
      final bookBloc = await _apiRepository.getPostByCategory(
          event.category_id, event.order_by);
      if (bookBloc.responsecode! < 0) {
        emit(BookError(bookBloc.description));
      } else {
        emit(BookLoaded(bookBloc));
      }
    });

    on<GetBookRank>((event, emit) async {
      emit(BookLoading());
      final bookBloc =
          await _apiRepository.getRankPost(event.type_rank, event.order_by);
      if (bookBloc.responsecode! < 0) {
        emit(BookError(bookBloc.description));
      } else {
        emit(BookLoaded(bookBloc));
      }
    });
    on<GetReleaseSchedule>((event, emit) async {
      emit(BookLoading());
      final bookBloc =
          await _apiRepository.releaseSchedule(event.week_day, event.order_by);
      if (bookBloc.responsecode! < 0) {
        emit(BookError(bookBloc.description));
      } else {
        emit(BookLoaded(bookBloc));
      }
    });
  }
}
