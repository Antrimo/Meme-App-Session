import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meme/Screens/card.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CardPage(),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 26, 8, 133),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                'assets/splash.json',
                height: 300,
                width: 300,
              ),
            ),
            const Text(
              "Welcome to Meme App",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Cursive",
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
