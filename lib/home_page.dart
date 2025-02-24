import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter_myproject_app/character_page.dart';
import 'package:flutter_myproject_app/detail_character.dart';
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

class CharacterPage extends StatelessWidget {
 CharacterPage({super.key});
 

    final List<Map<String, String>> maincharacters = [
     {
    "imagePath": "assets/images/1.png",
    "name": "MAX",
    "breed": "Jack Russell Terrier",
    "personality": "Loyal, Playful, and Energetic. Max is always ready to protect his owner and enjoys spending time with them, often bringing joy with his mischievous nature."
  },
  {
    "imagePath": "assets/images/2.webp",
    "name": "DUKE",
    "breed": "Mongrel",
    "personality": "Friendly, Easy-going, and Calm. Duke is a gentle giant who loves everyone and gets along well with other pets. He’s a bit of a laid-back dog who enjoys a good nap after a day of play."
  },
  {
    "imagePath": "assets/images/22.webp",
    "name": "SNOWBALL",
    "breed": "Rabbit",
    "personality": "Energetic, Mischievous, and Often Trouble-seeking. Snowball is a rabbit with a big attitude, always looking for ways to have fun, sometimes at the expense of others."
  },
    ];
  final List<Map<String,String>> thepet =[
    {
    "imagePath": "assets/images/11.png",
    "name": "GIDGET",
    "breed": "Pomeranian",
    "personality": "Energetic, Loving, and Overly Protective. Gidget has a big heart, always looking out for her friends and showing affection through her playful nature. She’s also fiercely loyal and protective of her loved ones."
  },
  {
    "imagePath": "assets/images/12.png",
    "name": "CHLOE",
    "breed": "Tabby Cat",
    "personality": "Lazy, Sarcastic, and Occasionally Snarky. Chloe prefers lounging around and often makes witty comments. She's not the most social cat, but when she does engage, it’s with a dry sense of humor."
  },
  {
    "imagePath": "assets/images/13.png",
    "name": "MEL",
    "breed": "Pug",
    "personality": "Excitable, Friendly, and Always Seeking Attention. Mel loves making new friends and can be overly enthusiastic, but his charm and adorable antics always win people over."
  },
  {
    "imagePath": "assets/images/14.png",
    "name": "BUDDY",
    "breed": "Dachshund",
    "personality": "Relaxed, Clever, and Playful. Buddy is a smart and resourceful dog who enjoys solving problems. He’s usually calm but knows how to have fun when the moment calls for it."
  },
  {
    "imagePath": "assets/images/15.png",
    "name": "POPS",
    "breed": "Basset Hound",
    "personality": "Wise, Chill, and Laid-back. Pops is the type of dog who enjoys taking things slow, often offering sage advice to the other pets. He’s very thoughtful and doesn’t get ruffled easily."
  },
  {
    "imagePath": "assets/images/16.png",
    "name": "NORMAN",
    "breed": "Guinea Pig",
    "personality": "Curious, Adventurous, and Slightly Shy. Norman is always exploring his environment, though he can be a bit timid at times. He enjoys making new discoveries but values his personal space."
  }];
  final List<Map<String,String>> other =[
    {
    "imagePath": "assets/images/21.webp",
    "name": "TATTOO",
    "breed": "pig",
    "personality": "Mysterious, Intense, and Often Detached. Tattoo has a brooding aura about him, preferring to keep his thoughts to himself. His intensity can sometimes be overwhelming, but he is fiercely loyal to those he trusts."
  },
  {
    "imagePath": "assets/images/22.png",
    "name": "LATEST",
    "breed": "crocodile",
    "personality": "Confident, Adventurous, and Charismatic. Latest is a bold individual who loves to take risks and push boundaries. He’s always the first to embark on a new adventure, leading the charge with unmatched confidence."
  },
  {
    "imagePath": "assets/images/23.webp",
    "name": "RIPPER",
    "breed": "bulldog ",
    "personality": "Aggressive, Tough, and Unforgiving. Ripper is known for his rough exterior and no-nonsense attitude. He can be fiercely protective and isn’t afraid to show his teeth when necessary."
  },
  {
    "imagePath": "assets/images/24.webp",
    "name": "DRAGON",
    "breed": "chameleon",
    "personality": "Fiery, Strong, and Passionate. Dragon’s presence commands attention, and he doesn’t shy away from challenges. His fierce personality matches his strength, and he’s always ready to fight for what he believes in."
  },
  {
    "imagePath": "assets/images/25.webp",
    "name": "OZONE",
    "breed": "sphinx",
    "personality": "Calm, Mysterious, and Contemplative. Ozone is the type who doesn’t speak much, but when he does, it’s full of wisdom. He’s deeply introspective, often lost in thought, but brings a sense of calm to those around him."
  },
  ];
  
  
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
      automaticallyImplyLeading: false,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
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
            const SizedBox(height: 20),

            // Main Characters Section (only Max, Duke, Snowball)
            const Text(
              'Main Characters',
              style: TextStyle(
                fontFamily: "Sunflare",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: maincharacters.map((char) {
                    return character(
                      context,
                      char["imagePath"]!,
                      char["name"]!,
                      char["breed"]!,
                      char["personality"]!,
                      isRectangle: false,
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'The Pets',
              style: TextStyle(
                fontFamily: "Sunflare",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: thepet.map((char) {
                    return character(
                      context,
                      char["imagePath"]!,
                      char["name"]!,
                      char["breed"]!,
                      char["personality"]!,
                      isRectangle: true,
                    );
                  }).toList(),
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
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: other.map((char) {
                    return character(
                      context,
                      char["imagePath"]!,
                      char["name"]!,
                      char["breed"]!,
                      char["personality"]!,
                      isRectangle: false,
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget character(
  BuildContext context,
  String imagePath,
  String name,
  String breed,
  String personality, {
  bool isRectangle = false,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailCharacter1(
            imagePath: imagePath,
            name: name,
            breed: breed,
            personality: personality,
          ),
        ),
      );
    },
    child: Padding(
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
                    fit: BoxFit.cover, // หรือ BoxFit.contain ถ้าคุณต้องการให้ภาพไม่ยืดขยายเกิน
                  ),
                )
              : ClipRRect(
                  child: Image.asset(
                    imagePath,
                    width: 120,
                    height: 120,
                  ),
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
    ),
  );
}

}