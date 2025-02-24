import 'package:flutter/material.dart';

class DetailCharacter1 extends StatefulWidget {
  const DetailCharacter1({super.key, required this.imagePath, required this.name, required this.breed,
    required this.personality,});
  
  final String imagePath;
  final String name;
  final String breed;
  final String personality;

  @override
  State<DetailCharacter1> createState() => _DetailCharacter1State();
}

class _DetailCharacter1State extends State<DetailCharacter1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50], // ใช้สีพื้นหลังพาสเทล
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(widget.name, 
          style: TextStyle(
            fontFamily: "Sunflare", // ฟอนต์ที่มีลักษณะขี้เล่น
            fontSize: 28, 
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pink[300], // ใช้สีชมพูที่สดใส
        elevation: 8, // เพิ่มเงาให้แถบแอพ
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.imagePath, // รูปภาพที่ส่งมาจากหน้าเดิม
                width: 135, // ลดขนาดให้พอดี
                height: 135, // ลดขนาดให้พอดี
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.name, // ชื่อของสัตว์
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[800], // ใช้สีม่วงเข้มเพื่อให้ดูน่าสนใจ
                fontFamily: "Sunflare", // ฟอนต์ที่เหมาะสม
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(20), // ปรับ padding ให้เหมาะสม
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30), // มุมโค้งมน
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "🐾 Breed: ${widget.breed}", // สายพันธุ์สัตว์
                    style: TextStyle(
                      fontFamily: "Sunflare",
                      fontSize: 22, 
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurple[600], // สีม่วงอ่อน
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "🐾 Personality: ${widget.personality}", // นิสัยของสัตว์
                    style: TextStyle(
                      fontFamily: "Sunflare",
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurple[600], // สีม่วงอ่อน
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Back to List',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "Sunflare"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
