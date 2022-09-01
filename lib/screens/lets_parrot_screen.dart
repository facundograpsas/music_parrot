import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:music_parrot/widgets/app_bar.dart';
import 'package:music_parrot/widgets/parrot_image.dart';

import '../constants/colors_constants.dart';
import '../melodies_player.dart';
import '../theme.dart';

class LetsParrotScreen extends StatefulWidget {
  const LetsParrotScreen({Key? key}) : super(key: key);

  @override
  State<LetsParrotScreen> createState() => _LetsParrotScreenState();
}

class _LetsParrotScreenState extends State<LetsParrotScreen> {
  final controller = Get.put(NotePlyerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Themes.lightTheme.colorScheme.background,
        appBar: const MyAppBar(widgets: [], title: Text('C Major')),
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                ParrotImage(height: 200, width: 200)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                  child: InkWell(
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.play_arrow_rounded,
                            size: 80,
                            color: Colors.green,
                          ),
                          Text(
                            'Play',
                            style: TextStyle(fontSize: 26),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Ink(
                  child: InkWell(
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.now_widgets_rounded,
                            size: 60,
                            color: Colors.purple,
                          ),
                          Text(
                            'New',
                            style: TextStyle(fontSize: 26),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: controller.currentScale.asMap().entries.map((entry) {
                return NoteButton(
                    number: (entry.key + 1).toString(),
                    onTapDown: (tdd) =>
                        controller.currentScale[entry.key].update((val) {
                          val?.isPlaying = true;
                        }),
                    onTapUp: (d) =>
                        controller.currentScale[entry.key].update((val) {
                          val?.isPlaying = false;
                        }));
              }).toList(),
            ),
          ]),
        ));
  }
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
            style: TextStyle(color: Colors.white),
          )),
        ));
  }
}
