import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_parrot/widgets/app_bar.dart';
import 'package:music_parrot/widgets/parrot_image.dart';

import '../constants/constants.dart';
import '../controllers/parroter_controller.dart';
import '../controllers/scales_controller.dart';
import '../melodies_player.dart';
import '../theme.dart';
import '../widgets/dropdowns.dart';
import '../widgets/note_button.dart';

class LetsParrotScreen extends StatefulWidget {
  const LetsParrotScreen({Key? key}) : super(key: key);

  @override
  State<LetsParrotScreen> createState() => _LetsParrotScreenState();
}

class _LetsParrotScreenState extends State<LetsParrotScreen> {
  final controller = Get.put(ScalesController());
  final pcontroller = Get.put(ParroterController());

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    double multiplier = 2.5;

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
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Select Key",
                              style: TextStyle(
                                  fontSize: multiplier * unitHeightValue),
                            ),
                            const KeysDropDown(),
                            Text(
                              "Select scale",
                              style: TextStyle(
                                  fontSize: multiplier * unitHeightValue),
                            ),
                            const ScalesDropDown(),
                            Text(
                              'Select instrument',
                              style: TextStyle(
                                  fontSize: multiplier * unitHeightValue),
                            ),
                            const InstrumentsDropDown()
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
                  onTap: () => {pcontroller.createMelody()},
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
                  onTap: () => {pcontroller.repeat()},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.repeat,
                          size: 60,
                          color: Colors.purple,
                        ),
                        Text(
                          'Repeat',
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
}
