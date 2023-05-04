import 'package:equatable/equatable.dart';
import 'package:toonder_comic/src/models/book.dart';
import 'package:toonder_comic/src/models/category.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final CategoryModel categoryModel;
  const CategoryLoaded(this.categoryModel);
}

class CategoryError extends CategoryState {
  final String? message;
  const CategoryError(this.message);
}
