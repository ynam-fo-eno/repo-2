import 'package:get/get.dart';

class UserController extends GetxController {
    var userList= [].obs;

    updateUserList(orodha) {
      userList.value=orodha;
    }
}