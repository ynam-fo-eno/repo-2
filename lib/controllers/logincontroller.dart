import 'package:get/get.dart';
//import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class LoginController extends GetxController {
  var email= "".obs;
  var fullName= "".obs;
  var role= "".obs;


  updateEmailAddress(eaddress){
      email.value=eaddress;
  }

  updateFullName(nameOne,nameTwo) {
      fullName.value = (nameOne +" "+ nameTwo);
  }

  
  updateRole(kaziYaMtu) {
      role.value= kaziYaMtu;
  }

  

}
