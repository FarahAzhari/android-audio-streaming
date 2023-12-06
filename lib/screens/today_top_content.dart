import 'package:flutter/material.dart';
import 'package:media_radio/utils/model/music.dart';
import 'package:media_radio/utils/model/music_operation.dart';

Widget createMusic(Music music) {
  return Padding(
    padding: const EdgeInsets.only(right: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: Image.asset(
            music.image,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          music.title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          music.desc,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    ),
  );
}

Widget createMusicList(String label) {
  List<Music> musicList = MusicOperations.getMusic();
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            // padding: EdgeInsets.all(5),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return createMusic(musicList[index]);
            },
            itemCount: musicList.length,
          ),
        ),
      ],
    ),
  );
}
