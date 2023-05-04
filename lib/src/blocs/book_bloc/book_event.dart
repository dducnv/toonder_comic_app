import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {}

class GetBookList extends BookEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetBookByCategory extends BookEvent {
  final int category_id;
  final int order_by;

  GetBookByCategory(this.category_id, this.order_by);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
