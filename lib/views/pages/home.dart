// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/controllers/chez_moi_controller.dart';
import 'package:flutter_application_0/views/pages/dashboard.dart';
//import 'package:flutter_application_0/views/pages/calc_ui.dart';
import 'package:flutter_application_0/views/pages/home_page.dart';
//import 'package:flutter_application_0/views/pages/memberslist.dart';
import 'package:flutter_application_0/views/pages/orders.dart';
import 'package:flutter_application_0/views/pages/user_profile.dart';
import 'package:get/get.dart';

HomeController homeController = Get.put(HomeController());
var screens = [
  Dashboard(),
  WelcomePage(),
  Orders(),
  UserProfile(),
];
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: textingWhite,
        buttonBackgroundColor: buttonColor1,
        color: primaryColor1,
        items: [
          Icon(Icons.home),
          Icon(Icons.star_border_rounded),
          Icon(Icons.production_quantity_limits),
          Icon(CupertinoIcons.person),
        ],
        onTap:(index) {
            homeController.updatePageSelected(index);
          },
      ), 
      body:Obx(
        () =>Center(
          child:screens[homeController.selectedPage.value],
        ),
      ),
    );
  }
}