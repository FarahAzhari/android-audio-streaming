import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayers extends StatefulWidget {
  const AudioPlayers({super.key, this.name, this.image, this.title});

  final String? name, image, title;

  @override
  State<AudioPlayers> createState() => _AudioPlayersState();
}

class _AudioPlayersState extends State<AudioPlayers> {
  final audioplayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    audioplayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioplayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioplayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioplayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverAppBar(
              backgroundColor: Colors.black,
              leading: Transform.rotate(
                angle: 45 * 22 / 7 / -90,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Colors.white70,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              centerTitle: true,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "PLAYING FROM PODCAST",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    widget.name!,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: const [
                Icon(
                  Icons.more_vert,
                  color: Colors.white70,
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 300,
                    color: Colors.white70,
                    child: Image.asset(
                      widget.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 250,
                            height: 30,
                            child: Marquee(
                              text: widget.title!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              blankSpace: 80,
                              pauseAfterRound:
                                  const Duration(milliseconds: 500),
                            ),
                          ),
                          Text(
                            widget.name!,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: const Color(0xFF32A4BE),
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioplayer.seek(position);

                      await audioplayer.resume();
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatTime(position),
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        formatTime(duration - position),
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: const Color(0xFF32A4BE),
                    foregroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () async {
                        if (isPlaying) {
                          await audioplayer.pause();
                        } else {
                          String url =
                              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
                          await audioplayer.play(UrlSource(url));
                        }
                      },
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      iconSize: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
