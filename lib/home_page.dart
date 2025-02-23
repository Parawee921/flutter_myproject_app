import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_myproject_app/character_page.dart';
import 'package:flutter_myproject_app/game_page.dart';
import 'package:flutter_myproject_app/ss1ss2_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    const CharacterPage(), // หน้า Home ที่แสดงตัวละคร
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

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 168, 216, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 168, 216, 255),
        toolbarHeight: 90,
        centerTitle: true,
        title: const Text(
          'PETS',
          style: TextStyle(
            fontFamily: "Sunflare",
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'The Secret Life of Pets',
                  style: TextStyle(
                    fontFamily: "Sunflare",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Meet The Characters',
                  style: TextStyle(
                    fontFamily: "Sunflare",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Main Character',
                style: TextStyle(
                  fontFamily: "Sunflare",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      character("assets/images/1.png", 'MAX'),
                      character("assets/images/2.webp", "DUKE"),
                      character("assets/images/22.webp", "SNOWBALL"),
                    ],
                  ),
                ),
              ),
              const Text(
                'The Pet',
                style: TextStyle(
                  fontFamily: "Sunflare",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      character("assets/images/11.png", '',isRectangle: true),
                      character("assets/images/12.png", "",isRectangle: true),
                      character("assets/images/13.png", "",isRectangle: true),
                      character("assets/images/14.png", "",isRectangle: true),
                      character("assets/images/15.png", "",isRectangle: true),
                      character("assets/images/16.png", "",isRectangle: true),
                    ],
                  ),
                ),
              ),
              const Text(
                'The Flushed Pets',
                style: TextStyle(
                  fontFamily: "Sunflare",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      character("assets/images/21.webp", 'TATTOO'),
                      character("assets/images/22.png", "LATEST"),
                      character("assets/images/23.webp", "RIPPER"),
                      character("assets/images/24.webp", "DRAGON"),
                      character("assets/images/25.webp", "OZONE"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget character(String imagePath, String name, {bool isRectangle = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isRectangle
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    width: 100,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                )
              : Image.asset(
                  imagePath,
                  width: 120,
                  height: 120,
                ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontFamily: "Sunflare",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
