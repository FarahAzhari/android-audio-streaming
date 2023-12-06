import 'package:flutter/material.dart';
import 'package:media_radio/pages/home/homepage.dart';

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Colors.white30,
              selectionColor: Colors.white30,
              selectionHandleColor: Color(0xFF32A4BE))),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildNavBar(),
      body: buildPages(),
    );
  }

  Widget buildNavBar() {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) => states.contains(MaterialState.selected)
              ? const TextStyle(color: Colors.white)
              : const TextStyle(color: Colors.white70),
        ),
      ),
      child: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Colors.black,
        indicatorColor: Colors.transparent,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white),
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white70,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search, color: Colors.white),
            icon: Icon(
              Icons.search_outlined,
              color: Colors.white70,
            ),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.library_add_check, color: Colors.white),
            icon: Badge(
                child: Icon(Icons.library_add_check_outlined,
                    color: Colors.white70)),
            label: 'My Library',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person, color: Colors.white),
            icon: Badge(
              label: Text('2'),
              child: Icon(
                Icons.person_outline,
                color: Colors.white70,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget buildPages() {
    switch (currentPageIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const Center(
          child: Text(
            'Search',
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
        );
      case 2:
        return const Center(
          child: Text(
            'My Library',
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
        );
      case 3:
      default:
        return const Center(
          child: Text(
            'Profile',
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
        );
    }
  }
}
