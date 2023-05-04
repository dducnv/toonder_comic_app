import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toonder_comic/src/blocs/cetegory_bloc/category_event.dart';
import 'package:toonder_comic/src/blocs/cetegory_bloc/category_state.dart';
import 'package:toonder_comic/src/resources/api_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetCategoryList>(
      (event, emit) async {
        emit(CategoryLoading());
        final categoryList = await _apiRepository.fetchCategory();
        if (categoryList.responsecode! < 0) {
          emit(CategoryError(categoryList.description));
        } else {
          emit(CategoryLoaded(categoryList));
        }
      },
    );
  }
}
