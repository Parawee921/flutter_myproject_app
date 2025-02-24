import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myproject_app/game_page.dart';
import 'package:flutter_myproject_app/home_page.dart';
import 'package:flutter_myproject_app/ss1ss2_page.dart';

class CharacterPage1 extends StatefulWidget {
  const CharacterPage1({super.key});

  @override
  State<CharacterPage1> createState() => _CharacterPage1State();
}

class _CharacterPage1State extends State<CharacterPage1> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey(); //CurvedNavigationBar ซึ่งเป็นแถบนำทางที่สามารถเลือกเพจต่าง ๆ ได้

  final List<Widget> _pages = [
    CharacterPage(),
    const AllCharacter(),
    const GameMatchingPage(), 
    const Ss1ss2Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
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
        backgroundColor: Colors.blueAccent,
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

class AllCharacter extends StatefulWidget {
  const AllCharacter({super.key});

  @override
  _AllCharacterState createState() => _AllCharacterState();
}

class _AllCharacterState extends State<AllCharacter> {
  String searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> characters = [
    {"imagePath": "assets/images/Max.webp", "name": "MAX"},
    {"imagePath": "assets/images/2.webp", "name": "DUKE"},
    {"imagePath": "assets/images/3.png", "name": "SNOWBALL"},
    {"imagePath": "assets/images/gidget.png", "name": "GIDGET"},
    {"imagePath": "assets/images/chole.png", "name": "CHOLE"},
    {"imagePath": "assets/images/buddy.webp", "name": "BUDDY"},
    {"imagePath": "assets/images/hu.webp", "name": "HU"},
    {"imagePath": "assets/images/leonard.webp", "name": "LEONARD"},
    {"imagePath": "assets/images/mel.webp", "name": "MEL"},
    {"imagePath": "assets/images/Norman.webp", "name": "NORMAN"},
    {"imagePath": "assets/images/Pepe.webp", "name": "PEPE"},
    {"imagePath": "assets/images/POPS.webp", "name": "POP"},
    {"imagePath": "assets/images/21.webp", "name": "TATTOO"},
    {"imagePath": "assets/images/22.png", "name": "LATEST"},
    {"imagePath": "assets/images/23.webp", "name": "RIPPER"},
    {"imagePath": "assets/images/24.webp", "name": "DRAGON"},
    {"imagePath": "assets/images/25.webp", "name": "OZONE"},
    {"imagePath": "assets/images/reginald.png", "name": "REGINALD"},
    {"imagePath": "assets/images/Sweet_Pea.webp", "name": "SWEET PEA"},
    {"imagePath": "assets/images/Daisy.webp", "name": "DAISY(2)"},
    {"imagePath": "assets/images/rooster.webp", "name": "ROOSTER(2)"},
    {"imagePath": "assets/images/little sergei.png","name": "LITTLE SERGEI(2)"},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredCharacters = characters
        .where((char) =>
            char["name"]!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
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
          child: Column(
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
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value; // อัปเดตค่า searchQuery เมื่อพิมพ์
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 500, // กำหนดความสูงให้ GridView
                child: filteredCharacters.isEmpty
                    ? const Center(
                        child: Text(
                          "Not Found",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,//กำหนดจำนวนคอลัม
                          crossAxisSpacing: 10,//ระยะห่างระหว่างคอลัมน์ในแนวนอน (
                          mainAxisSpacing: 10,//ระยะห่างระหว่างแถวในแนวตั้ง
                          childAspectRatio: 0.8,//กำหนดอัตราส่วนของขนาดของแต่ละไอเทม
                        ),
                        itemCount: filteredCharacters.length,
                        itemBuilder: (context, index) {
                          return character(
                            filteredCharacters[index]["imagePath"]!,//เป็นการดึงข้อมูลเส้นทางของรูปภาพของตัวละครจาก filteredCharacters ที่ตำแหน่ง index
                            filteredCharacters[index]["name"]!,//เป็นการดึงชื่อของตัวละครจาก filteredCharacters ที่ตำแหน่ง index
                          );
                        },
                      ),
              )
            ],
          ),
        ));
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
