import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toonder_comic/src/blocs/banner_bloc/banner_event.dart';
import 'package:toonder_comic/src/blocs/banner_bloc/banner_state.dart';
import 'package:toonder_comic/src/resources/api_repository.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc() : super(BannerInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetBannerList>((event, emit) async {
      emit(BannerLoading());
      final bannerList = await _apiRepository.fetchBanner();
      if (bannerList.responsecode! < 0) {
        emit(BannerError(bannerList.description));
      } else {
        emit(BannerLoaded(bannerList));
      }
    });
  }
}
