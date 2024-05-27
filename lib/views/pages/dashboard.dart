// ignore_for_file: no_logic_in_create_state, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_function_type_syntax_for_parameters

//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/controllers/logincontroller.dart';
import 'package:flutter_application_0/controllers/user_controller.dart';
//import 'package:flutter_application_0/models/user_model.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:get/get.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

UserController userController = Get.put(UserController());
LoginController loginController = Get.put(LoginController());

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  @override
  Widget build(BuildContext context) {
    //userDeetsDisplay();
    return Obx(
      () => Center(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor2,
            foregroundColor: textingWhite,
          ),
          body: Center(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                loginController.role.value == "1"
                    ? Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: primaryColor2,
                    borderRadius: BorderRadius.only(
                      //bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  //Below is still part of the body...
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),
                          title: CustomizedTextWidget(
                            label: "Dashboard",
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: CustomizedTextWidget(
                            label: "Hello, ${loginController.fullName.value} (Admin)",
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                )
                    :
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: primaryColor2,
                    borderRadius: BorderRadius.only(
                      //bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  //Below is still part of the body...
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),
                          title: CustomizedTextWidget(
                            label: "Dashboard",
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: CustomizedTextWidget(
                            label: "Hello, ${loginController.fullName.value}",
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: primaryColor2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/starbackground.jpg'),
                        fit: BoxFit.cover,
                      ),
                      color: textingWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                      ),
                    ),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 30,
                      children: [
                        itemsDashboard(
                          title: "Stars",
                          iconData: CupertinoIcons.moon_stars,
                          background: Colors.blue,
                          unAction: () => Get.toNamed("/stars"),
                        ),
                        itemsDashboard(
                          title: "Products or Tools",
                          iconData: Icons.shop_rounded,
                          background: Colors.green,
                          unAction: () => Get.toNamed("/produits"),
                        ),
                        itemsDashboard(
                          title: "Profile",
                          iconData: Icons.person,
                          background: Colors.red,
                          unAction: () => Get.toNamed("/user_profile"),
                        ),
                        itemsDashboard(
                          title: "Orders",
                          iconData: CupertinoIcons.doc_on_clipboard_fill,
                          background: Colors.yellow,
                          unAction: () => Get.toNamed("/les_ordres"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  itemsDashboard(
          {required String title,
          IconData? iconData,
          Color? background,
          VoidCallback? unAction}) =>
      Container(
        decoration: BoxDecoration(
            color: textingWhite,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(5, 5),
                color: textingWhite.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: unAction,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                elevation: 0,
                shape: CircleBorder(),
                padding: EdgeInsets.all(20),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: textingWhite),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(title.toUpperCase(),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      );
}
