import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toonder_comic/src/blocs/banner_bloc/banner_bloc.dart';
import 'package:toonder_comic/src/blocs/banner_bloc/banner_event.dart';
import 'package:toonder_comic/src/blocs/banner_bloc/banner_state.dart';
import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/banner.dart';

class CarouselCustom extends StatefulWidget {
  const CarouselCustom({Key? key}) : super(key: key);

  @override
  _CarouselCustomState createState() => _CarouselCustomState();
}

class _CarouselCustomState extends State<CarouselCustom>
    with SingleTickerProviderStateMixin {
  final BannerBloc _bannerBloc = BannerBloc();
  int _activeIndex = 0;
  final PageController _controller = PageController(initialPage: 0);
  List<Info> bannerData = [];
  @override
  void initState() {
    _bannerBloc.add(GetBannerList());
    super.initState();
  }

  void _animateSlider() {
    Future.delayed(Duration(seconds: 3)).then((_) {
      int _nextPage = _controller.page!.round() + 1;
      _activeIndex = _nextPage;
      if (_nextPage == bannerData.length) {
        _nextPage = 0;
      }

      _controller
          .animateToPage(_nextPage,
              duration: Duration(milliseconds: 300), curve: Curves.linear)
          .then((_) => _animateSlider());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bannerBloc,
      child: BlocListener<BannerBloc, BannerState>(
        listener: (context, state) {
          if (state is BannerError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message!)));
          }
        },
        child: BlocBuilder<BannerBloc, BannerState>(
          builder: (context, state) {
            if (state is BannerInitial) {
              return _buildLoading();
            } else if (state is BannerLoading) {
              return _buildLoading();
            } else if (state is BannerLoaded) {
              return buildCarousel(context, state.banner);
            } else if (state is BannerError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget buildCarousel(BuildContext context, BannerModel model) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView.builder(
            key: const PageStorageKey('carousel_banner'),
            controller: _controller,
            itemCount: model.info?.length,
            onPageChanged: (page) {
              setState(() {
                _activeIndex = page;
              });
            },
            itemBuilder: (context, index) {
              final urlImage = model.info?[index];
              return buildImage(urlImage?.imgUrl as String, index);
            },
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 25,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                    GlobalColors.bgColor.withOpacity(0.1),
                    GlobalColors.bgColor.withOpacity(0.4),
                    GlobalColors.bgColor.withOpacity(1)
                  ])),
            ),
          ),
          Positioned(bottom: 25, child: buildIndicator(model)),
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        // margin: EdgeInsets.symmetric(horizontal: 12),
        child: ProgressiveImage(
          placeholder: const AssetImage('assets/images/logo.png'),
          // size: 1.87KB
          thumbnail: NetworkImage(urlImage),
          // size: 1.29MB
          image: NetworkImage(urlImage),
          height: MediaQuery.of(context).size.height * 0.7,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator(BannerModel bannerModel) => AnimatedSmoothIndicator(
        activeIndex: _activeIndex,
        onDotClicked: (index) => _controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear),
        count: bannerModel.info!.length,
        effect: ScrollingDotsEffect(
            dotColor: GlobalColors.nonActiveColor.withOpacity(0.4),
            activeDotColor: GlobalColors.orangeColor,
            dotWidth: 13,
            dotHeight: 13),
      );
  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
