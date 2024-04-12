// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:flutter_application_0/configs/constants.dart';
//import 'package:flutter_application_0/views/pages/first_list.dart';
import 'package:flutter_application_0/utils/routes.dart';
//import 'package:flutter_application_0/views/widgets/customizedtext.dart';
//import 'package:flutter_application_0/views/pages/calc_ui.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

//import 'package:flutter_application_0/views/pages/login.dart';

void main() {
  runApp(GetMaterialApp(
    /*home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomizedTextWidget(
            label: "Testing API...",
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
          backgroundColor: paleGreen,
          foregroundColor: textingWhite,
        ),
        body: FirstList(),
      ),
    ),*/
    //OG method of running these pages above.
    //Below is how we involve packages and a class made in utils
    //to do the same.
    initialRoute: "/login",
    debugShowCheckedModeBanner: false,
    getPages: TimosRoutes.paths,
  ));
}

//Command to run on terminal:
//flutter run -d chrome --web-renderer html
