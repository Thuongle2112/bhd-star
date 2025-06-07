import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerPage extends StatefulWidget {
  final String trailerUrl;

  const MovieTrailerPage({super.key, required this.trailerUrl});

  @override
  State<MovieTrailerPage> createState() => _MovieTrailerPageState();
}

class _MovieTrailerPageState extends State<MovieTrailerPage> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.trailerUrl);
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _youtubePlayerController.toggleFullScreenMode();
    });
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _youtubePlayerController),
        builder: (context, player) {
          return Stack(
            children: [
              Center(child: AspectRatio(aspectRatio: 16 / 9, child: player)),
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
