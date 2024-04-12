// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/controllers/logincontroller.dart';
import 'package:flutter_application_0/views/widgets/custombutton.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:get/get.dart';

LoginController loginController = Get.put(LoginController());

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          //Here the child to the SCSV is decided by the value of role, hence how it'll 
          //differentiate a user from an admin from here.
          child: loginController.role.value == "0"
              ?
              //For normal user...
              Center(
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
                                  Image.asset("assets/images/bluestar.jpg",
                                      height: 200, width: 200),
                                  CustomizedTextWidget(
                                    label: "Welcome to your personal profile.",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomizedTextWidget(
                                    label:
                                        "Hope you like it and please feel free to update it as needed",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
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
              : 
                Center(
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
                                CustomizedTextWidget(
                                  label: "Here's a list of our users so far",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
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
    );
  }
}
