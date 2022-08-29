import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:music_parrot/home.dart';
import 'package:music_parrot/melodies_player.dart';

import '../theme.dart';

class LevelsPage extends StatefulWidget {
  const LevelsPage({Key? key}) : super(key: key);

  @override
  State<LevelsPage> createState() => _LevelsPageState();
}

class _LevelsPageState extends State<LevelsPage> {
  @override
  Widget build(BuildContext context) {
    final controller = MelodiesPlayerController();

    return Scaffold(
      backgroundColor: Themes.lightTheme.colorScheme.background,
      appBar: MyAppBar(widgets: [
        Hero(
          tag: 'parrot',
          child: Container(
            margin:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 10),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/parrot.png'),
            )),
            width: 50,
            height: 50,
          ),
        )
      ], title: Text("Levels")),
      body: ListView(
        children: [
          MelodiesPlayer(controller: controller),
          Center(
              child: LevelCard(
            controller: controller,
            scale: 'C Major',
            octaves: '1',
          )),
          // Center(
          //     child: LevelCard(

          //   scale: 'C Minor',
          //   octaves: '1',
          // )),
          // Center(
          //     child: LevelCard(
          //   scale: 'C Cromatic',
          //   octaves: '1',
          // )),
        ],
      ),
    );
  }
}

class LevelCard extends StatelessWidget {
  final String scale;
  final String octaves;
  final MelodiesPlayerController controller;

  const LevelCard(
      {required this.controller,
      required this.scale,
      required this.octaves,
      super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    player.onPlayerStateChanged
        .listen((PlayerState s) => {print('Current player state: $s')});

    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 7,
      child: Card(
        color: const Color.fromARGB(255, 234, 255, 175),
        child: InkWell(
          onTap: () async => {
            // await player.setSource(AssetSource('audio/as.wav')),
            // await player.resume()
            controller.startPlaying()
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  scale,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'Octaves: $octaves',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
