import 'package:equatable/equatable.dart';
import 'package:toonder_comic/src/models/book.dart';
import 'package:toonder_comic/src/models/discover_model.dart';

abstract class BookDiscoverState extends Equatable {
  const BookDiscoverState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookDiscoverState {}

class BookLoading extends BookDiscoverState {}

class BookLoaded extends BookDiscoverState {
  final DiscoverModel books;
  const BookLoaded(this.books);
}

class BookError extends BookDiscoverState {
  final String? message;
  const BookError(this.message);
}
