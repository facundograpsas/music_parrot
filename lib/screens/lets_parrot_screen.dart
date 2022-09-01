import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_parrot/widgets/app_bar.dart';
import 'package:music_parrot/widgets/parrot_image.dart';

import '../constants/constants.dart';
import '../controllers/scales_controller.dart';
import '../melodies_player.dart';
import '../theme.dart';

class LetsParrotScreen extends StatefulWidget {
  const LetsParrotScreen({Key? key}) : super(key: key);

  @override
  State<LetsParrotScreen> createState() => _LetsParrotScreenState();
}

class _LetsParrotScreenState extends State<LetsParrotScreen> {
  final controller = Get.put(ScalesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Themes.lightTheme.colorScheme.background,
        appBar: const MyAppBar(widgets: [], title: Text("Let's parrot")),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const NotePlayer(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Select scale",
                              style: TextStyle(fontSize: 22),
                            ),
                            Obx(
                              () => DropdownButton<String>(
                                  value: controller.scaleName.value,
                                  items: Scales.scalesNames
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: onChanged),
                            ),
                          ],
                        ),
                        const Expanded(child: ParrotImage())
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Ink(
                child: InkWell(
                  onTap: () => {controller.changeScale('cMinor')},
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
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: controller.currentScale.asMap().entries.map((entry) {
                  return NoteButton(
                      number: (entry.key + 1).toString(),
                      onTapDown: (tdd) =>
                          controller.currentScale[entry.key].update((val) {
                            val.isPlaying = true;
                          }),
                      onTapUp: (d) =>
                          controller.currentScale[entry.key].update((val) {
                            val?.isPlaying = false;
                          }));
                }).toList(),
              )),
        ]));
  }

  void onChanged(value) {
    controller.scaleName.value = value;
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
            style: const TextStyle(color: Colors.white),
          )),
        ));
  }
}
