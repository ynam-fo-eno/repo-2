import 'package:get/get.dart';
//import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class StarController extends GetxController {
  var starList = [].obs;

  updateStarList(list) {
    starList.value = list;
  }
}
