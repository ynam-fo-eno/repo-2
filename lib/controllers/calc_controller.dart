import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var sum=0.0.obs;
  var firstNum = 0.0.obs;
  var secondNum = 0.0.obs;
  var name="".obs;

  updateSum(var newSum,){
   
    sum.value = newSum;
  } 

  updateValues(var newFirst, var newSecond,var usersName) {
      firstNum.value = newFirst;
      secondNum.value = newSecond;
      name.value=usersName;
  }

}