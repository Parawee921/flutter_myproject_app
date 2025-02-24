import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart'; // สำหรับ rootBundle
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myproject_app/character_page.dart';
import 'package:flutter_myproject_app/home_page.dart';
import 'package:flutter_myproject_app/ss1ss2_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    CharacterPage(),
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
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}

class GameMatchingPage extends StatefulWidget {
  const GameMatchingPage({super.key});

  @override
  State<GameMatchingPage> createState() => _GameMatchingPageState();
}

class _GameMatchingPageState extends State<GameMatchingPage> {
  List<String> imagePaths = [];
  List<String> shuffledImages = [];//คือlist เก็บภาพที่สุ่มมาใช้ในเกม
  List<bool> isSelected = List.generate(8, (_) => false);//ลิสต์ที่เก็บสถานะของการเลือกภาพ (เลือกแล้วหรือยังไม่เลือก)
  int selectedCount = 0;
  int selectedIndex = -1; //ตัวแปรเก็บดัชนีของภาพที่เลือก
  int matchedPairs = 0; //ตัวแปรที่เก็บจำนวนคู่ภาพที่จับคู่ได้

  @override
  void initState() { //เรียกเมื่อ widget ถูกสร้างขึ้นครั้งแรก และใช้โหลดข้อมูลภาพ
    super.initState();
    _loadImagePaths(); //ดึงภาพจาก assets

    // ซ่อนรูปภาพทั้งหมดหลังจาก 3 วินาที
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isSelected = List.generate(8, (_) => false);
      });
    });
  }

  Future<void> _loadImagePaths() async {
    try {
      final manifestJson = await rootBundle.loadString('AssetManifest.json');//ฟังก์ชันนี้จะโหลดไฟล์ AssetManifest.json ซึ่งเก็บข้อมูลเกี่ยวกับไฟล์ในโฟลเดอร์ assets ของแอป
      final Map<String, dynamic> manifestMap = json.decode(manifestJson);
      final List<String> assets = manifestMap.keys
          .where((path) => path.startsWith('assets/images/'))
          .toList();

      if (assets.length >= 4) {
        setState(() {
          imagePaths = assets;
          shuffledImages = _getRandomPairs();
        });
      }
    } catch (e) {
      debugPrint('Error loading assets: $e');
    }
  }

  List<String> _getRandomPairs() {
    final random = Random();
    if (imagePaths.length < 4) return [];
    List<String> selectedImages = List.from(imagePaths)..shuffle(random);
    List<String> pairs = selectedImages.take(4).toList();
    pairs = [...pairs, ...pairs];//คัดลอกภาพ 4 ภาพที่เลือกมาซ้ำอีกครั้งเพื่อสร้างคู่
    pairs.shuffle(random);//สุ่มลำดับภาพทั้งหมด (รวมภาพคู่) เพื่อให้เกมแต่ละครั้งไม่เหมือนกัน
    return pairs;
  }

  void _selectImage(int index) {
    if (isSelected[index]) return;//ถ้าภาพนี้ถูกเลือกแล้ว, จะไม่ทำอะไร
    setState(() { //ใช้เพื่ออัปเดตสถานะของการเลือกภาพ (เช่น เลือกแล้วหรือยังไม่ได้เลือก)
      isSelected[index] = true;
      selectedCount++;

      if (selectedCount == 2) {
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            if (shuffledImages[selectedIndex] == shuffledImages[index] &&
                selectedIndex != index) {
              matchedPairs++;
              if (matchedPairs == 4) _showCongratDialog();
            } else {
              isSelected[selectedIndex] = false;
              isSelected[index] = false;
            }
            selectedCount = 0;
          });
        });
      } else {
        selectedIndex = index;
      }
    });
  }

  void _showCongratDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations! 🎉'),
          content: const Text('You have matched all images!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _resetGame();
              },
              child: const Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      isSelected = List.generate(8, (_) => false);
      selectedCount = 0;
      matchedPairs = 0;
      shuffledImages = _getRandomPairs();
    });

    // รีเซ็ตรูปหลังจาก 3 วินาที
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isSelected = List.generate(8, (_) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 168, 216, 255),
      appBar: AppBar(
        toolbarHeight: 90,
        title: const Text(
          'Game Matching',
          style: TextStyle(
            fontFamily: "Sunflare",
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 168, 216, 255),
        automaticallyImplyLeading: false,
      ),
      body: imagePaths.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8, // ลดขนาดกรอบ
                mainAxisSpacing: 8, // ลดขนาดกรอบ
              ),
              padding: const EdgeInsets.all(8), // ลดขนาดกรอบรอบนอก
              itemCount: shuffledImages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _selectImage(index),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: isSelected[index] ? Colors.white : Colors.pink.shade300,
                    child: Center(
                      child: isSelected[index]
                          ? Image.asset(
                              shuffledImages[index],
                              width: 80, // ลดขนาดรูป
                              height: 80, // ลดขนาดรูป
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
