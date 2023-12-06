import 'package:flutter/material.dart';
import 'package:media_radio/screens/for%20you/new_release_items.dart';
import 'package:media_radio/utils/constants/cover_card.dart';
import 'package:media_radio/json/card_json.dart';

class NewRelease extends StatelessWidget {
  const NewRelease({
    super.key,
    required this.titleText,
  });

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 5),
          child: Text(
            titleText,
            style: const TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(newReleases.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: CoverCard(
                  image: newReleases[index]['img'],
                  title: newReleases[index]['title'],
                  desc: newReleases[index]['description'],
                  navigation: NewReleaseItem(
                    item: newReleases[index],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
