import 'package:equatable/equatable.dart';
import 'package:toonder_comic/src/models/banner.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerLoaded extends BannerState {
  final BannerModel banner;
  const BannerLoaded(this.banner);
}

class BannerError extends BannerState {
  final String? message;
  const BannerError(this.message);
}
