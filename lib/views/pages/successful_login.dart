// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/views/widgets/custombutton.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:get/get.dart';

class SuccessfulLogin extends StatelessWidget {
   const SuccessfulLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Center(
          child: const CustomizedTextWidget(
              label: "To our established members..",
              labelsColor:textingGray,
              fontWeight: FontWeight.bold,
              fontSize: 20),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Image.asset("assets/images/redstar.jpg",
                      height: 200, width: 200),
                  CustomizedTextWidget(
                    label: "Congrats and Welcome!",
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  CustomButton(
                    buttonText: "Enter dashboard",
                    unAction: () =>  Get.toNamed("/home"),
                  ),
              ]
          ),
        ),
        ),
      ),
    );
  }
  
}