import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_radio/utils/constants/circular_container.dart';
import 'package:media_radio/utils/constants/home_controller.dart';
import 'package:media_radio/utils/constants/rounded_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners
              .map((url) => RoundedImage(applyImageRadius: true, imageUrl: url))
              .toList(),
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  CircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? const Color(0xFF32A4BE)
                        : Colors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
