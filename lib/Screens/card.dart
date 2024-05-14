import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:video_player/video_player.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final List<SwipeItem> _swipeItems = [];
  late MatchEngine _matchEngine;

  final List<String> memeUrls = [
    'https://img.freepik.com/free-vector/simple-vibing-cat-square-meme_742173-4493.jpg',
    'https://media.sproutsocial.com/uploads/meme-example.jpg',
    'https://img.freepik.com/free-vector/simple-vibing-cat-square-meme_742173-4493.jpg',
    'https://media.sproutsocial.com/uploads/meme-example.jpg',
  ];

  @override
  void initState() {
    super.initState();
    for (String url in memeUrls) {
      _swipeItems.add(
        SwipeItem(
          content: url,
          likeAction: () {},
          nopeAction: () {},
        ),
      );
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 67, 36, 241),
      body: Center(
        child: SwipeCards(
          matchEngine: _matchEngine,
          itemBuilder: (BuildContext context, int index) {
            final memeUrl = _swipeItems[index].content as String;
            return Card(
              child: memeUrl.endsWith('.mp4')
                  ? VideoPlayerWidget(url: memeUrl)
                  : Image.network(memeUrl, fit: BoxFit.cover),
            );
          },
          onStackFinished: () {},
          upSwipeAllowed: true,
          fillSpace: true,
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  const VideoPlayerWidget({super.key, required this.url});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
