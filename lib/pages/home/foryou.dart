import 'package:flutter/material.dart';
import 'package:media_radio/screens/new_releases.dart';
import 'package:media_radio/screens/today_top_content.dart';
import 'package:media_radio/utils/constants/banner_slider.dart';
import 'package:media_radio/utils/constants/image_strings.dart';

class ForYou extends StatelessWidget {
  const ForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.all(15),
                child: BannerSlider(
                  banners: [
                    StringImages.forYouBanner1,
                    StringImages.forYouBanner2,
                    StringImages.forYouBanner3
                  ],
                )),
            const NewRelease(titleText: 'New Releases'),
            const SizedBox(
              height: 20,
            ),
            createMusicList('Today\'s Top Content'),
          ],
        ),
      ),
    );
  }
}
