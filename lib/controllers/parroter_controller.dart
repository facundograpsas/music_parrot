import 'dart:math';

import 'package:get/get.dart';
import 'package:music_parrot/controllers/scales_controller.dart';

import '../constants/constants.dart';

class ParroterController extends GetxController {
  final controller = Get.put(ScalesController());
  final _random = new Random();

  List<Tone> melody = [];

  void playSong() {
    isPlaying.value = !isPlaying.value;
  }

  var isPlaying = false.obs;

  void createMelody() {
    melody.clear();
    for (var i = 0; i < _random.nextInt(5) + 2; i++) {
      Tone element = controller.currentScale
          .value[_random.nextInt(controller.currentScale.value.length)].value;
      melody.add(element);
    }
    playSong();
  }

  void repeat() {
    playSong();
  }
}
