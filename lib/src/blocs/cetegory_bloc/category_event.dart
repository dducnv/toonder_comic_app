import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {}

class GetCategoryList extends CategoryEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
