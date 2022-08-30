import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MelodiesPlayer extends StatefulWidget {
  const MelodiesPlayer({Key? key}) : super(key: key);

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
        startMelodie('c');
      }
    });

    controller.c.listen((val) {
      // if (val) {
      startMelodie('c');
      // }
    });

    controller.d.listen((val) {
      if (val) {
        startMelodie('d');
      }
    });

    player.onPlayerComplete.listen((event) {
      player.stop();
    });
    super.initState();
  }

  Future<void> startMelodie(tone) async {
    await player.setSource(AssetSource('audio/$tone.wav'));
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
  final c = false.obs;
  final d = false.obs;

  void startPlaying() {
    play.value = !play.value;
  }

  void playC() {
    c.value = !c.value;
  }

  void playD() {
    d.value = !d.value;
  }
}
