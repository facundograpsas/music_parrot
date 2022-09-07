import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constants/constants.dart';

class ScalesController extends GetxController {
  var initialKeyNumber = 60.obs;
  var currentKeyNumber = 60.obs;

  var currentScalePattern = Scales.scales['Major'].obs;
  var currentScale = [].obs;

  @override
  void onReady() {
    super.onReady();
    setScale();
  }

  @override
  void onInit() {
    super.onInit();
    currentKeyNumber.listen((newKey) {
      initialKeyNumber.value = newKey;
      setScale();
    });

    currentScalePattern.listen((newScale) {
      initialKeyNumber.value = currentKeyNumber.value;
      setScale();
    });
  }

  void setScale() {
    currentScale.value = [
      ...currentScalePattern.value!.map((e) {
        var tone = Tone('', initialKeyNumber.value, false).obs;
        initialKeyNumber += e;
        return tone;
      })
    ];
  }

  changeScale(scale) {
    currentScalePattern.value = scale;
  }
}
