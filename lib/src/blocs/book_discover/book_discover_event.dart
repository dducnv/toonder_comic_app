import 'package:equatable/equatable.dart';

abstract class BookDiscoverEvent extends Equatable {}

class GetBookList extends BookDiscoverEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetBookByCategory extends BookDiscoverEvent {
  final int category_id;
  final int order_by;

  GetBookByCategory(this.category_id, this.order_by);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetBookRank extends BookDiscoverEvent {
  final int type_rank;
  final int order_by;

  GetBookRank(this.type_rank, this.order_by);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetReleaseSchedule extends BookDiscoverEvent {
  final int week_day;
  final int order_by;

  GetReleaseSchedule(this.week_day, this.order_by);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
