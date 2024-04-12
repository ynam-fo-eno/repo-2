// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/controllers/logincontroller.dart';
//import 'package:flutter_application_0/views/pages/registration_file.dart';
//import 'package:flutter_application_0/views/pages/successful_login.dart';
import 'package:flutter_application_0/views/widgets/custombutton.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:flutter_application_0/views/widgets/customtextfield.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

LoginController loginController = Get.put(LoginController());

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future<void> login() async {
      if(usernameController.text !="" && passwordController.text != "") {
        var url = Uri.parse("http://localhost/php-attempt1/login.php?email=${usernameController.text.trim()}&password=${passwordController.text.trim()}");
        var reponse = await http.get(url);
        var data = json.decode(reponse.body);
        int loginStatus= data["success"];
        if (loginStatus == 1) {
          Fluttertoast.showToast(
              msg: "Login Successful!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0);
          var userData=data["userdata"];
          var email= userData[0]["email"];
          var name_1= userData[0]["name_1"];
          var name_2= userData[0]["name_2"];
          var role= userData[0]["role"];


          print(email);
          print(name_1);
          print(name_2);
          print(role);


          loginController.updateEmailAddress(email);
          loginController.updateFullName(name_1, name_2);
          loginController.updateRole(role);
          Get.toNamed("/home");

        } 
        else {
          Fluttertoast.showToast(
              msg: "Sorry, username or password incorrect.Try again",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
      else {
         Fluttertoast.showToast(
            msg: "Please fill in ALL the fields and fill them correctly.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0
          );
      }
      
    }
    return Center(
      child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: const CustomizedTextWidget(
                  label:"ST4&&Y \"App\" ",
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
                  }),
              ListTile(
                  leading: Icon(Icons.app_registration),
                  title: Text("Register"),
                  onTap: () {
                    Get.toNamed("/registration_file");
                  }),
              ListTile(
                  leading: Icon(Icons.dashboard_customize_rounded),
                  title: Text("Dashboard"),
                  onTap: () {
                    Get.toNamed("/dashboard");
                  }),
              ListTile(
                  leading: Icon(Icons.calculate),
                  title: Text("Basic Calculator"),
                  onTap: () {
                    Get.toNamed("/");
                  }),
              ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Members' List"),
                  onTap: () {
                    Get.toNamed("/memberslist");
                  }),
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/bluestar.jpg",
                        height: 200, width: 200),
                    CustomizedTextWidget(
                      label: "Login Screen",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomizedTextWidget(
                      label: "Username/Email",
                    ),
                    CustomTextField(
                      controller: usernameController,
                      hintMessage: "Name?Or email?",
                      startIcon: Icons.people,
                    ),
                    CustomizedTextWidget(label: "Password"),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintMessage: "Password",
                      obscured: true,
                      niPassword: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      buttonText: "Login",
                      unAction: () =>login(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      buttonText: "Get account if none",
                      unAction: () => Get.toNamed("/registration_file"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      buttonText: "Check out my calc,man!",
                      unAction: () => Get.toNamed("/"),
                    ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
