// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sort_child_properties_last, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/controllers/logincontroller.dart';
import 'package:flutter_application_0/controllers/produit_controller.dart';
import 'package:flutter_application_0/controllers/user_controller.dart';
import 'package:flutter_application_0/models/user_model.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
//import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var lesNoms = [
  "Telescope",
  "Tent",
];

UserController userController = Get.put(UserController());
ProductController productController = Get.put(ProductController());
LoginController loginController = Get.put(LoginController());

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    //productDisplay();
    userDeetsDisplay();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
        title: Center(
          child: const CustomizedTextWidget(
              label: "ST4&&Y",
              labelsColor: defaultBlack,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        backgroundColor: paleGreen,
        foregroundColor: textingWhite,
      ),
      body:ListView.builder(
            shrinkWrap: true,
            itemCount: ((userController.userList.length) + 0),
            itemBuilder: (context, index) {
              return Center(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 150,
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.network(
                          "http://localhost/php-attempt1/user_images/${userController.userList[index].photo}",
                          height: 100,
                          width: 100,
                        ),
                        Expanded(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${index + 1}.${userController.userList[index].name_1}\n ${userController.userList[index].name_2}",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: textingWhite,
                                    backgroundColor: textingGray,
                                  ),
                                ),
                                Text(
                                  "${userController.userList[index].email}\n ${userController.userList[index].phone_no}",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: textingWhite,
                                    backgroundColor: textingGray,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              );
            }),
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
