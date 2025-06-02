import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerCarousel extends StatelessWidget {
  final List<String> bannerImages;
  final int currentBannerIndex;
  final Function(int) onPageChanged;

  const BannerCarousel({
    super.key,
    required this.bannerImages,
    required this.currentBannerIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.25,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: (index, _) => onPageChanged(index),
          ),
          items:
              bannerImages.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(
                      item,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade800,
                          child: const Center(
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.white54,
                              size: 40,
                            ),
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: Colors.black,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    );
                  },
                );
              }).toList(),
        ),

        Positioned(
          bottom: 16,
          child: AnimatedSmoothIndicator(
            activeIndex: currentBannerIndex,
            count: bannerImages.length,
            effect: const ScrollingDotsEffect(
              dotWidth: 8,
              dotHeight: 8,
              spacing: 5,
              activeDotColor: Colors.white,
              dotColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
