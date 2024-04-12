import 'package:get/get.dart';
//import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class OrderController extends GetxController {
  var orderList = [].obs;

  updateOrderList(orodha) {
    orderList.value=orodha;
  }
}
