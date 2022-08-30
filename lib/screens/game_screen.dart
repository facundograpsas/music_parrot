import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:music_parrot/widgets/app_bar.dart';
import 'package:music_parrot/widgets/parrot_image.dart';

import '../theme.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
            InkWell(
              onTap: () => {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(1),
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
              children: const [
                NoteButton(number: '1'),
                NoteButton(number: '2'),
                NoteButton(number: '3'),
                NoteButton(number: '4'),
                NoteButton(number: '5'),
                NoteButton(number: '6'),
                NoteButton(number: '7'),
              ],
            ),
          ]),
        ));
  }
}

class NoteButton extends StatelessWidget {
  final String number;

  const NoteButton({
    required this.number,
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
        width: 50,
        child: InkWell(
          onTap: () => {},
          child: Center(
              child: Text(
            number,
            style: TextStyle(color: Colors.white),
          )),
        ));
  }
}
