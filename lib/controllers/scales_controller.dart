import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constants/constants.dart';

class ScalesController extends GetxController {
  var initialKeyNumber = 60.obs;
  var currentKeyNumber = 60.obs;

  var initialScale = 'Major'.obs;
  var currentScalePattern = Scales.scales['Major'].obs;

  @override
  void onReady() {
    super.onReady();
    currentScale.value = [
      ...currentScalePattern.value!.map((e) {
        var tone = Tone('', initialKeyNumber.value, false).obs;
        initialKeyNumber += e;
        return tone;
      })
    ];
  }

  @override
  void onInit() {
    super.onInit();
    currentKeyNumber.listen((newKey) {
      initialKeyNumber.value = newKey;
      currentScale.value = [
        ...currentScalePattern.value!.map((e) {
          var tone = Tone('', initialKeyNumber.value, false).obs;
          initialKeyNumber += e;
          return tone;
        })
      ];
    });

    currentScalePattern.listen((newScale) {
      initialKeyNumber.value = currentKeyNumber.value;
      currentScale.value = [
        ...currentScalePattern.value!.map((e) {
          var tone = Tone('', initialKeyNumber.value, false).obs;
          initialKeyNumber += e;
          return tone;
        })
      ];
    });
  }

  var currentScale = [].obs;

  var scaleName = 'C Major'.obs;

  changeScale(scale) {
    currentScalePattern.value = scale;
  }
}
