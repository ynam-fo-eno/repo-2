import 'package:get/get.dart';
//import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class ProductController extends GetxController {
  var productList= [].obs;

  updateProductList(list) {
    productList.value=list;
  }
}