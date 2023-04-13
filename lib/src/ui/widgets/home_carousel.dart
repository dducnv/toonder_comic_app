import 'package:carousel_slider/carousel_slider.dart';
import 'package:toonder_comic/src/constants/color.global.dart';
import 'package:toonder_comic/src/models/banner.dart';
import 'package:toonder_comic/src/networks/network_request.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:progressive_image/progressive_image.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _activeIndex = 0;
  final carouselController = CarouselController();

  List<BannerModal> bannerData = [];

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchBanners().then((res) {
      setState(() {
        bannerData = res;
      });
    }).catchError((onError) => {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: bannerData.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = bannerData[index];
                    return buildImage(urlImage.imgUrl as String, index);
                  },
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      autoPlay: true,
                      initialPage: 0,
                      height: MediaQuery.of(context).size.height * 0.8,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reson) =>
                          setState(() => _activeIndex = index))),
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
          ),
        ),
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
        onDotClicked: (index) => carouselController.animateToPage(index),
        count: bannerData.length,
        effect: ScrollingDotsEffect(
            dotColor: GlobalColors.nonActiveColor.withOpacity(0.4),
            activeDotColor: GlobalColors.orangeColor,
            dotWidth: 13,
            dotHeight: 13),
      );
}
