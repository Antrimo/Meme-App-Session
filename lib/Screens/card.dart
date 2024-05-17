import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;

  @override
  void initState() {
    super.initState();
    _swipeItems.add(SwipeItem(
      content: _buildCard('User 1', 'assets/hinata.jpg'),
    ));
    _swipeItems.add(SwipeItem(
      content: _buildCard('User 2', 'assets/zoro.jpg'),
    ));
    _swipeItems.add(SwipeItem(
      content: _buildCard('User 2', 'assets/sed.jpeg'),
    ));
    _swipeItems.add(SwipeItem(
      content: _buildCard('User 2', 'assets/real.jpeg'),
    ));
    _swipeItems.add(SwipeItem(
      content: _buildCard('User 2', 'assets/sukuna.jpg'),
    ));
    _swipeItems.add(SwipeItem(
      content: _buildCard('User 2', 'assets/gojo.jpg'),
    ));
    _swipeItems.add(SwipeItem(
      content: _buildCard('User 2', 'assets/spyfam.jpg'),
    ));
    // ... Add more SwipeItems

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  Widget _buildCard(String name, String imagePath) {
    return Card(
      child: Stack(
        children: [
          Image.asset(imagePath,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(name,
                style: const TextStyle(fontSize: 24, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwipeCards(
        matchEngine: _matchEngine!,
        itemBuilder: (BuildContext context, int index) {
          return _swipeItems[index].content;
        },
        onStackFinished: () {
          // Handle when all cards are swiped
        },
      ),
    );
  }
}
