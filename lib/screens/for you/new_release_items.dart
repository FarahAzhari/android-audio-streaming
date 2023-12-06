import 'package:flutter/material.dart';
import 'package:media_radio/screens/audio_players.dart';
import 'package:readmore/readmore.dart';

class NewReleaseItem extends StatefulWidget {
  const NewReleaseItem({super.key, this.item});

  final dynamic item;

  @override
  State<NewReleaseItem> createState() => _NewReleaseItemState();
}

class _NewReleaseItemState extends State<NewReleaseItem> {
  bool bookmarkSelected = false;
  bool downloadSelected = false;
  bool followSelected = false;

  @override
  Widget build(BuildContext context) {
    List items = widget.item['items'];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliverAppBarDelegate(
              expandedHeight: 200,
              title: widget.item['title'],
              profile: widget.item['profile'],
              image: widget.item['img'],
            ),
            pinned: true,
          ),
          buildHeader(),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                color: Colors.transparent,
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            widget.item['img'],
                            fit: BoxFit.cover,
                            width: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            items[index]['title'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            items[index]['description'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          items[index]['uploadedAt'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '•',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          items[index]['duration'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          color: Colors.white70,
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () {},
                        ),
                        IconButton(
                            color: Colors.white70,
                            icon:
                                const Icon(Icons.download_for_offline_outlined),
                            onPressed: () {}),
                        IconButton(
                          iconSize: 50,
                          color: const Color(0xFF32A4BE),
                          icon: const Icon(Icons.play_circle_fill_rounded),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AudioPlayers(
                                  name: items[index]['name'],
                                  image: items[index]['img'],
                                  title: items[index]['title'],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            childCount: items.length,
          )),
        ],
      ),
    );
  }

  Widget buildHeader() => SliverPadding(
        padding: const EdgeInsets.only(top: 75),
        sliver: SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.item['title'],
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  widget.item['name'],
                  style: const TextStyle(fontSize: 18, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                ReadMoreText(
                  widget.item['description'],
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  lessStyle: const TextStyle(
                      fontWeight: FontWeight.w500, color: Color(0xFF32A4BE)),
                  moreStyle: const TextStyle(
                      fontWeight: FontWeight.w500, color: Color(0xFF32A4BE)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.item['listeners'],
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '•',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.item['episodes'],
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.outlined(
                      isSelected: bookmarkSelected,
                      color: const Color(0xFF32A4BE),
                      icon: const Icon(Icons.bookmark_outline),
                      selectedIcon: const Icon(Icons.bookmark),
                      onPressed: () {
                        setState(() {
                          bookmarkSelected = !bookmarkSelected;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          followSelected = !followSelected;
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: AnimatedContainer(
                          height: 40,
                          width: 150,
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                              color: followSelected
                                  ? const Color(0xFF32A4BE)
                                  : const Color(0x00ffffff),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: followSelected
                                    ? Colors.transparent
                                    : Colors.grey.shade600,
                              )),
                          child: Center(
                              child: Text(
                                  followSelected ? 'Following' : 'Follow',
                                  style: TextStyle(
                                      color: followSelected
                                          ? Colors.white
                                          : Colors.white,
                                      fontSize: 16)))),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton.outlined(
                      isSelected: downloadSelected,
                      color: const Color(0xFF32A4BE),
                      icon: const Icon(Icons.download_outlined),
                      selectedIcon: const Icon(Icons.download),
                      onPressed: () {
                        setState(() {
                          downloadSelected = !downloadSelected;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(0),
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Find in this show...',
                      filled: true,
                      fillColor: Colors.white54,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String? title, profile, image;

  CustomSliverAppBarDelegate({
    required this.expandedHeight,
    required this.title,
    required this.profile,
    required this.image,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const size = 150;
    final top = expandedHeight - shrinkOffset - size / 2;
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          top: top,
          left: 100,
          right: 100,
          child: buildFloating(shrinkOffset),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;
  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
      );

  Widget buildBackground(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Image.asset(
          profile!,
          fit: BoxFit.cover,
        ),
      );

  Widget buildFloating(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: SizedBox(
          height: 150,
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

  Widget buildTitle(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title!,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
