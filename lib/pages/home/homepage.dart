import 'package:flutter/material.dart';
import 'package:media_radio/pages/home/foryou.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('ZMedia'),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/splash.png',
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            ],
            backgroundColor: Colors.black,
            surfaceTintColor: Colors.black,
            foregroundColor: Colors.white,
            bottom: const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorColor: Color(0xFF32A4BE),
                indicatorWeight: 2,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                dividerColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'For You',
                  ),
                  Tab(
                    text: 'Radio',
                  ),
                  Tab(
                    text: 'Podcast',
                  ),
                  Tab(
                    text: 'Events',
                  ),
                  Tab(
                    text: 'Live',
                  ),
                  Tab(
                    text: 'Other',
                  ),
                ]),
            elevation: 20,
            titleSpacing: 10,
          ),
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const ForYou(),
                buildPage('Radio Page'),
                buildPage('Podcast Page'),
                buildPage('Events Page'),
                buildPage('Live Page'),
                buildPage('Other Page'),
              ]),
        ),
      );

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 28, color: Colors.white),
        ),
      );
}
