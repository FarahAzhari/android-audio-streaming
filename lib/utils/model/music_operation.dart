import 'package:media_radio/utils/constants/image_strings.dart';
import 'package:media_radio/utils/model/music.dart';

class MusicOperations {
  MusicOperations._();
  static List<Music> getMusic() {
    return <Music>[
      Music(StringImages.podcastCard1, 'Forever Young', 'FY is The Revolution'),
      Music(
          StringImages.podcastCard2, 'Kill This Love', 'We are Commit to Love'),
      Music(StringImages.podcastCard5, 'How You Like That',
          'Look at You Now Look at Me'),
    ];
  }
}

class NewReleaseModel {
  final String image;
  final String title;
  final String desc;

  NewReleaseModel(
      {required this.image, required this.title, required this.desc});

  static List<NewReleaseModel> list = [
    NewReleaseModel(
        image: StringImages.podcastCard1,
        title: 'Station One',
        desc: 'This is a Description'),
    NewReleaseModel(
        image: StringImages.podcastCard2,
        title: 'Station Two',
        desc: 'This is a Description'),
    NewReleaseModel(
        image: StringImages.podcastCard3,
        title: 'Station Three',
        desc: 'This is a Description'),
  ];
}
