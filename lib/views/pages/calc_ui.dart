// ignore_for_file: no_logic_in_create_state, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
//import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/controllers/calc_controller.dart';
//import 'package:flutter_application_0/views/widgets/custombutton.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:flutter_application_0/views/widgets/customtextfield.dart';
import 'package:get/get.dart';
//import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

//Msee...you get it subconsciously, but you need to comment every section of this code!
//Overall, not just this Calculator UI that stumped you a bit.
class Calculator extends StatelessWidget {
  const Calculator({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNumController = TextEditingController();
    TextEditingController secondNumController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    CalculatorController calculatorController = Get.put(CalculatorController());
    //TextEditingController calculationResultController = TextEditingController();
    //double sum=0.0;
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const CustomizedTextWidget(
                label: "Constellations \"App\"",
                labelsColor: defaultBlack,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          backgroundColor: paleGreen,
          foregroundColor: textingWhite,
        ),
        drawer: NavigationDrawer(
          children: [
            ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Get.toNamed("/home");
                }
              ),
            ListTile(
                leading: Icon(Icons.app_registration),
                title: Text("Login/Register"),
                onTap: () {
                  Get.toNamed("/login");
                }
              ),
            ListTile(
                leading: Icon(Icons.dashboard_customize_rounded),
                title: Text("Dashboard"),
                onTap: () {
                  Get.toNamed("/dashboard");
                }
              ),
            ListTile(
                leading: Icon(Icons.calculate),
                title: Text("Basic Calculator"),
                onTap: () {
                  Get.toNamed("/");
                }
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Members List"),
                onTap: () {
                  Get.toNamed("/memberslist");
                }
              ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(50.0),
          child: Column(
            children: [
              CustomTextField(
                controller: firstNumController,
                hintMessage: "Enter 1st number",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: secondNumController,
                hintMessage: "Enter 2nd number",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: nameController,
                hintMessage: "Your name",
              ),
              SizedBox(
                height: 20,
              ),
              //CustomButton(buttonText: "Sum?",),
              ElevatedButton(
                onPressed: () {
                  double firstNum = double.parse(firstNumController.text);
                  double secondNum = double.parse(secondNumController.text);
                  String name = nameController.text;
                  double result = firstNum + secondNum;
                  calculatorController.updateSum(result);
                  calculatorController.updateValues(firstNum, secondNum, name);
                  //firstNumController.text = "";
                  //secondNumController.text="";
                  //print(sum);
                },
                child: Text("Sum?"),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () => CustomizedTextWidget(
                    label:
                        "Sum of ${calculatorController.firstNum} & ${calculatorController.secondNum}  is: ${calculatorController.sum}\nGood day to you, ${calculatorController.name}."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
