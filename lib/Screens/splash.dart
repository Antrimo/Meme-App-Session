import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meme/Screens/card.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CardPage(),
            ),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/splash.json',
                height: 300,
                width: 300,
              ),
              const Text("Welcome to Meme App",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Cursive",
                      fontStyle: FontStyle.italic)),
            ],
          ),
        ),
      ),
    );
  }
}
