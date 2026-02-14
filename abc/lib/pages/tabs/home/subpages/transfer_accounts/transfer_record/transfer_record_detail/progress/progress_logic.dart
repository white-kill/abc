import 'dart:math';

import 'package:get/get.dart';

import 'progress_state.dart';

class ProgressLogic extends GetxController {
  final ProgressState state = ProgressState();


  String time = '';
  String code2 = '';
  @override
  void onInit() {
    super.onInit();

    time =  Get.arguments?['time']??'';

    List timeList = time.split(' ');
    if(timeList.isNotEmpty){
      code2 = timeList.first;
      code2 = code2.replaceAll('/', '');
    }
  }

  String generateRandomEightDigits() {
    final random = Random();
    return List.generate(8, (_) => random.nextInt(10)).join();
  }
}
