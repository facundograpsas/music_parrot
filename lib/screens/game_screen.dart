import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_parrot/widgets/app_bar.dart';
import 'package:music_parrot/widgets/parrot_image.dart';

import '../controllers/scales_controller.dart';
import '../widgets/note_player.dart';
import '../theme.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final controller = Get.put(ScalesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Themes.lightTheme.colorScheme.background,
        appBar: const MyAppBar(widgets: [], title: Text('C Major')),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  NotePlayer(),
                  Text(
                    "C Major",
                    style: TextStyle(fontSize: 26),
                  ),
                  Text(
                    "Level 1",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const ParrotImage(height: 200, width: 200)
            ],
          ),
          InkWell(
            onTap: () => {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(1),
                  height: 100.0,
                  width: 100.0,
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 100,
                    color: Colors.green,
                  ),
                ),
                const Text(
                  'Play melodie',
                  style: TextStyle(fontSize: 26),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [],
          ),
        ]));
  }

  // playCNote(TapDownDetails details) {
  //   var note = controller.notes.firstWhere((element) => element.note == 'c');
  // }
}

class NoteButton extends StatelessWidget {
  final String number;
  final Function(TapDownDetails) onTapDown;
  final Function(TapUpDetails) onTapUp;

  const NoteButton({
    required this.number,
    required this.onTapDown,
    required this.onTapUp,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 187, 255, 190), width: 1),
            color: const Color.fromARGB(255, 76, 158, 55)),
        height: 50,
        width: 40,
        child: InkWell(
          onTapUp: (details) => onTapUp(details),
          onTapDown: (details) => onTapDown(details),
          // onTap: () => onTap,
          child: Center(
              child: Text(
            number,
            style: const TextStyle(color: Colors.white),
          )),
        ));
  }
}
