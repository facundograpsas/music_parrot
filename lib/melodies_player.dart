import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MelodiesPlayer extends StatefulWidget {
  final MelodiesPlayerController controller;

  const MelodiesPlayer({required this.controller, Key? key}) : super(key: key);

  @override
  State<MelodiesPlayer> createState() => _MelodiesPlayerState();
}

class _MelodiesPlayerState extends State<MelodiesPlayer> {
  @override
  final player = AudioPlayer();
  final controller = Get.put(MelodiesPlayerController());

  void initState() {
    // TODO: implement initState

    controller.play.listen((val) {
      if (val) {
        startMelodie();
      }
    });

    // player.onPlayerComplete.listen((event) {
    //   player.resume();
    // });
    super.initState();
  }

  Future<void> startMelodie() async {
    await player.setSource(AssetSource('audio/as.wav'));
    await player.resume();
    print("Starts melodie");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MelodiesPlayerController extends GetxController {
  final play = false.obs;

  void startPlaying() {
    play.value = !play.value;
  }
}
