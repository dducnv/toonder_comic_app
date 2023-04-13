import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:toonder_comic/src/networks/network_request.dart';
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
  int _activeIndex = 0;
  final PageController _controller = PageController(initialPage: 0);
  List<BannerModal> bannerData = [];
  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchBanners().then((res) {
      setState(() {
        bannerData = res;
      });
    }).catchError((onError) => {});
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
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
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: PageView.builder(
            controller: _controller,
            itemCount: bannerData.length,
            onPageChanged: (page) {
              setState(() {
                _activeIndex = page;
              });
            },
            itemBuilder: (context, index) {
              final urlImage = bannerData[index];
              return buildImage(urlImage.imgUrl as String, index);
            },
          ),
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
        Positioned(bottom: 20, child: buildIndicator()),
      ],
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
          height: MediaQuery.of(context).size.height * 0.8,
          width: double.infinity,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: _activeIndex,
        onDotClicked: (index) => _controller.animateToPage(index,
            duration: Duration(milliseconds: 300), curve: Curves.linear),
        count: bannerData.length,
        effect: ScrollingDotsEffect(
            dotColor: GlobalColors.nonActiveColor.withOpacity(0.4),
            activeDotColor: GlobalColors.orangeColor,
            dotWidth: 13,
            dotHeight: 13),
      );
}
