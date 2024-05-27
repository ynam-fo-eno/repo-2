// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/controllers/logincontroller.dart';
import 'package:flutter_application_0/controllers/user_controller.dart';
import 'package:flutter_application_0/views/widgets/custombutton.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_0/models/user_model.dart';
//import 'package:image_picker/image_picker.dart';
//import 'dart:io';

LoginController loginController = Get.put(LoginController());
UserController userController = Get.put(UserController());

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
  @override
  Widget build(BuildContext context) {
    //userDeetsDisplay();
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const CustomizedTextWidget(
                label: "ST4&&Y: Your Profile",
                labelsColor: textingGray,
                fontWeight: FontWeight.bold,
                fontSize: 40),
          ),
          backgroundColor: paleGreen,
          foregroundColor: textingWhite,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/starbackground.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            //Here the child to the SCSV is decided by the value of role, hence how it'll
            //differentiate a user from an admin from here.
            child: loginController.role.value == "0"
                ?
                //For normal user...
                Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      "http://localhost/php-attempt1/user_images/${loginController.photo.value}",
                                      height: 300,
                                      width: 300,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: textingWhite,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      child: CustomizedTextWidget(
                                        label:
                                            "Name : \n${loginController.fullName.value}",
                                        fontWeight: FontWeight.bold,
                                        labelsColor: textingGray,
                                        fontSize: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: textingWhite,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      child: CustomizedTextWidget(
                                        label:
                                            "Email Address :\n${loginController.email.value}",
                                        labelsColor: textingGray,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: textingWhite,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      child: CustomizedTextWidget(
                                        label:
                                            "Phone Number : ${loginController.phone_no.value}",
                                        labelsColor: textingGray,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        Fluttertoast.showToast(
                                            msg:
                                                "We'll let you know when it is.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 4,
                                            backgroundColor: Colors.blue,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        Fluttertoast.showToast(
                                            msg:
                                                "Sorry this is yet to be functional.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 4,
                                            backgroundColor: Colors.blue,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      },
                                      child: Text("Update Profile Pic"),
                                      color: buttonColor1,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    CustomButton(
                                      buttonText: "Logout",
                                      unAction: () => Get.toNamed("/login"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  )
                //...ends here.
                //Admin side below.
                : Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/redstar.jpg",
                                      height: 200, width: 200),
                                  CustomizedTextWidget(
                                    label:
                                        "Welcome, admin ${loginController.fullName.value}.",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomButton(
                                    buttonText: "View Users",
                                    unAction: () => Get.toNamed("/user_list"),
                                  ),
                                  CustomButton(
                                    buttonText: "Logout",
                                    unAction: () => Get.toNamed("/login"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> userDeetsDisplay() async {
    http.Response reponse =
        await http.get(Uri.parse("http://localhost/php-attempt1/read.php"));
    if (reponse.statusCode == 200) {
      var serverResponse = json.decode(reponse.body);
      var userResponse = serverResponse["data"];
      var userList =
          userResponse.map((user) => UserModel.fromJson(user)).toList();
      userController.updateUserList(userList);
    } else {
      Text("Error");
    }
  }
}
