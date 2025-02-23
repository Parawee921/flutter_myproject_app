import 'package:flutter/material.dart';
import 'package:flutter_myproject_app/home_page.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 168, 216, 255),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 168, 216, 255),
          foregroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 150, // เพิ่มความสูงของ AppBar
          title: Padding(
            padding: EdgeInsets.only(top: 90, bottom: 15),
            child: Text(
              'PETS',
              style: TextStyle(
                fontFamily: "Sunflare",
                fontSize: 120,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      body: Center(
          child: Column(
        children: [
          Image.asset(
            'assets/images/pet1.png',
            width: 400,
            height: 400,
          ),
          const Text(
            'the secret life of pets',
            style: TextStyle(
              fontFamily: "Sunflare",
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                'assets/images/dog.png',
                width: 85,
                height: 85,
              ),
              const SizedBox(
                width: 10,
              ),
              LiteRollingSwitch(
                width: 250,
                value: false,
                textOn: 'START NOW',
                textOff: 'START NOW',
                iconOff: Icons.arrow_forward_ios,
                textSize: 16.0,
                onTap: () {},
                onDoubleTap: () {},
                onSwipe: () {},
                onChanged: (bool state) {
                  if (state) {
                    _navitoHomepage(context);
                  }
                },
                colorOn: Colors.pink.shade300,
                colorOff: Colors.brown.shade300,
              ),
            ],
          )
        ],
      )),
    );
  }

  void _navitoHomepage(BuildContext ctx) {
    Navigator.of(ctx).push(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1000),
        pageBuilder: (_, animation, __) => HomePage(),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: animation.drive(Tween(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.easeInOut))),
            child: child,
          );
        }));
  }
}
