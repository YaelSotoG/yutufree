import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// import 'package:yutu_free/src/pages/home_page.dart';

class ViewVideo extends StatefulWidget {
  final String id, title;
  ViewVideo(this.id, this.title);
  @override
  _ViewVideoState createState() => _ViewVideoState();
}

class _ViewVideoState extends State<ViewVideo> {
  YoutubePlayerController _controller;
  Isolate isolate;
  void runyoutube() {
    _controller = YoutubePlayerController(
      initialVideoId: this
          .widget
          .id, //entra al statefull ya que esto es el estado y regresa el estado del widget id
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        enableCaption: false,
      ),
    );
  }

  @override
  void initState() {
    runyoutube();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  Future<void> background() async {
    isolate = await Isolate.spawn(videoIsolate, _controller);
  }

  static void videoIsolate(YoutubePlayerController _controller) async {
    print('si agarro');
    YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          return player;
        });
  }

  @override
  Widget build(BuildContext context) {
    background();
    return SafeArea(
        child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
            ),
            builder: (context, player) {
              return Scaffold(
                body: Column(
                  children: [
                    player,
                    SizedBox(height: 20.0),
                    Text(widget.title),
                    SizedBox(
                      width: 15,
                    ),
                    Text('vistas y fecha'),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.thumb_up_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.thumb_down_alt_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share_outlined),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.playlist_add_outlined),
                        ),
                        TextButton(
                          child: Text('Suscribirse'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }));
  }
}
