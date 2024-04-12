// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_element, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/views/widgets/custombutton.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:flutter_application_0/views/widgets/customtextfield.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationFile extends StatelessWidget {
  const RegistrationFile({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController secondNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmedPasswordController = TextEditingController();

    Future register() async {
      if(firstNameController.text!="" && secondNameController.text !="" && phoneNumberController.text!=""  &&
          emailController.text != "" &&
          passwordController.text != "" && passwordController.text==confirmedPasswordController.text){
        var url = Uri.parse("http://localhost/php-attempt1/register.php");
        var reponse = await http.post(url, body: {
          "name_1": firstNameController.text.trim(),
          "name_2": secondNameController.text.trim(),
          "phone_no": phoneNumberController.text.trim(),
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
        });
        var data = json.decode(reponse.body);
        int registrationStatus = data["success"];
        if (registrationStatus == 0) {
          Fluttertoast.showToast(
              msg: "Sorry, user already exists",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        else {
          Fluttertoast.showToast(
              msg: "Registration successful",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
              Get.toNamed("/successful_login");
        }
      }
      
      else {
          Fluttertoast.showToast(
              msg: "The password fields especially.Check that original password and confirmed match!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 4,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0
            );
            Fluttertoast.showToast(
            msg: "Please fill in ALL the fields and fill them correctly.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const CustomizedTextWidget(
              label: "Constellations\"App\"#1",
              labelsColor: defaultBlack,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        backgroundColor: paleGreen,
        foregroundColor: textingWhite,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/redstar.jpg",
                    height: 200, width: 200),
                CustomizedTextWidget(
                  label: "New Account Registration Screen",
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                CustomTextField(
                  controller: firstNameController,
                  hintMessage: "First Name?",
                  startIcon: Icons.people,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: secondNameController,
                  hintMessage: "Second Name?",
                  startIcon: Icons.people,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: phoneNumberController,
                  hintMessage: "Phone number (10 digits)",
                  startIcon: Icons.phone,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: emailController,
                  hintMessage: "Email Address",
                  startIcon: Icons.mail_outline,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: passwordController,
                  hintMessage: "Enter password",
                  obscured: true,
                  niPassword: true,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: confirmedPasswordController,
                  hintMessage: "Confirm password above",
                  obscured: true,
                  niPassword: true,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  buttonText: "Save details",
                  unAction: () => register(),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  buttonText: "Login if account present",
                  unAction: () => Get.toNamed("/login"),
                ),
              ]),
        ),
      )),
    );
  }
}
