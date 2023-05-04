import 'package:equatable/equatable.dart';
import 'package:toonder_comic/src/models/book.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final BookModel books;
  const BookLoaded(this.books);
}

class BookError extends BookState {
  final String? message;
  const BookError(this.message);
}
