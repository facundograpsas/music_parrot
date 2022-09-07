import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:music_parrot/widgets/app_bar.dart';
import 'package:music_parrot/widgets/parrot_image.dart';

import '../constants/constants.dart';
import '../controllers/parroter_controller.dart';
import '../controllers/scales_controller.dart';
import '../note_player.dart';
import '../theme.dart';
import '../widgets/dropdowns.dart';
import '../widgets/note_button.dart';

class LetsParrotScreen extends StatefulWidget {
  const LetsParrotScreen({Key? key}) : super(key: key);

  @override
  State<LetsParrotScreen> createState() => _LetsParrotScreenState();
}

class _LetsParrotScreenState extends State<LetsParrotScreen>
    with TickerProviderStateMixin {
  final scalesController = Get.put(ScalesController());
  final parroterController = Get.put(ParroterController());
  late final AnimationController _controller;
  final player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this)
      ..value = 0.5
      ..duration = Duration(milliseconds: 2000);
    // ..addListener(() {
    //   // setState(() {
    //   //   // Rebuild the widget at each frame to update the "progress" label.
    //   // });
    // });
    parroterController.showWinAnimation.listen((p0) async {
      if (p0) {
        _controller.reset();
        _controller.forward();
        await player.play(AssetSource(
            '/audio/success.wav')); // will immediately start playing
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

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
                        Expanded(
                            child: Stack(children: [
                          ParrotImage(),
                          Container(
                            child: Obx(
                              () => Visibility(
                                visible:
                                    parroterController.showWinAnimation.value,
                                child: Lottie.asset(
                                    'assets/lottie/61147-excellent.json',
                                    controller: _controller,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover, onLoaded: (composition) {
                                  setState(() {
                                    _controller.duration = composition.duration;
                                  });
                                }),
                              ),
                            ),
                          ),
                        ]))
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
                  onTap: () => {parroterController.createMelody()},
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
                  onTap: () => {parroterController.repeat()},
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
                children:
                    scalesController.currentScale.asMap().entries.map((entry) {
                  return NoteButton(
                      number: (entry.key + 1).toString(),
                      onTapDown: (tdd) => scalesController
                              .currentScale[entry.key]
                              .update((val) {
                            val.isPlaying = true;
                          }),
                      onTapUp: (d) => scalesController.currentScale[entry.key]
                              .update((val) {
                            val?.isPlaying = false;
                          }));
                }).toList(),
              )),
        ]));
  }
}
