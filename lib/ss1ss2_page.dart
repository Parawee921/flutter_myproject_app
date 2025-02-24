import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_myproject_app/character_page.dart';
import 'package:flutter_myproject_app/game_page.dart';
import 'package:flutter_myproject_app/home_page.dart';
import 'package:video_player/video_player.dart';

class Ss1ss2Page1 extends StatefulWidget {
  const Ss1ss2Page1({super.key});

  @override
  State<Ss1ss2Page1> createState() => _Ss1ss2Page1State();
}

class _Ss1ss2Page1State extends State<Ss1ss2Page1> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    CharacterPage(), // หน้า Home ที่แสดงตัวละคร
    const AllCharacter(),
    const GameMatchingPage(),
    const Ss1ss2Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 168, 216, 255),
      body: _pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.search),
            label: 'Character',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.games_outlined),
            label: 'Game',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.book_online),
            label: 'Synopsis',
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 168, 216, 255),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}

class Ss1ss2Page extends StatefulWidget {
  const Ss1ss2Page({super.key});

  @override
  State<Ss1ss2Page> createState() => _Ss1ss2PageState();
}

class _Ss1ss2PageState extends State<Ss1ss2Page> {
  late VideoPlayerController _controllerSS1;
  late VideoPlayerController _controllerSS2;

  @override
  void initState() {
    super.initState();

    _controllerSS1 = VideoPlayerController.asset('assets/video/ss1.mp4')
      ..initialize().then((_) {
        if (mounted) setState(() {});
      });

    _controllerSS2 = VideoPlayerController.asset('assets/video/ss2.mp4')
      ..initialize().then((_) {
        if (mounted) setState(() {});
      });
  }

  @override
  void dispose() {
    _controllerSS1.dispose();
    _controllerSS2.dispose();
    super.dispose();
  }

  Widget buildVideoPlayer(VideoPlayerController controller) {
    return GestureDetector(
      onTap: () {
        setState(() {
          controller.value.isPlaying ? controller.pause() : controller.play();
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),
          if (!controller.value.isPlaying)
            Container(
              color: Colors.black45,
              child: Icon(
                Icons.play_arrow,
                size: 50,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 168, 216, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 168, 216, 255),
          automaticallyImplyLeading: false,
          title: const Text("The Secret Life of Pets"),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'SS1'),
              Tab(text: 'SS2'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // SS1 Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "The Secret Life of Pets (SS1) - Synopsis:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "The Secret Life of Pets tells the story of Max, a Jack Russell Terrier, whose life is turned upside down when his owner adopts a large dog named Duke. The two dogs don't get along and get lost in the city. While they're missing, their pet friends from the apartment, led by a bunny named Snowball, try to rescue them. Max and Duke eventually work together to overcome challenges and return home safely, learning about friendship and loyalty along the way.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Highlights (SS1):",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "- Max and Duke try to adapt...\n"
                      "- An adventure in New York City...",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    if (_controllerSS1.value.isInitialized)
                      buildVideoPlayer(_controllerSS1)
                    else
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
            // SS2 Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "The Secret Life of Pets 2 (SS2) - Synopsis:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "*The Secret Life of Pets 2** follows Max, who becomes protective of his owner’s son, Liam, while also facing new challenges. He goes on a farm vacation, where he learns to overcome his fears with the help of a tough farm dog, Rooster. Meanwhile, Gidget tries to rescue Max’s favorite toy from a cat-filled apartment, and Snowball plays superhero to save a dog from a circus. The movie explores bravery, friendship, and growing up.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Highlights (SS2):",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "- Max and his new owner must adapt...\n"
                      "- Snowball becomes a hero...",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    if (_controllerSS2.value.isInitialized)
                      buildVideoPlayer(_controllerSS2)
                    else
                      const Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
