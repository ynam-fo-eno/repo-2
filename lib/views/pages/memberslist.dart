// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unused_element, unrelated_type_equality_checks, empty_catches, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/controllers/student_controller.dart';
import 'package:flutter_application_0/models/student_model.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var lesNoms = [
  "Timothy Mwenda",
  "Mark Mithi",
  "Mikhail Tal",
  "Shivam Manish",
  "Allan Muruha",
];

StudentController studentController = Get.put(StudentController());

class Etudiants extends StatelessWidget {
  const Etudiants({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    getStudentData();
    return Center(

      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const CustomizedTextWidget(
                label: "Members List",
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
                title: Text("Login"),
                onTap: () {
                  Get.toNamed("/login");
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
                title: Text("Members List"),
                onTap: () {
                  Get.toNamed("/memberslist");
                }),
          ],
        ),
        body: Column(
          children: [
            studentController.isLoadingStudentData == true? 
            Center(child: Text("Loading"))
                :
            ListView.builder(
                    shrinkWrap: true,
                    itemCount: studentController.studentList.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Obx(
                          () => SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                //Image.network("${index + 1}. ${studentController.studentList[index].image}"),
                                Text(
                                  "${index + 1}. ${studentController.studentList[index].std_name} ${studentController.studentList[index].admission_num}",
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
                      );
                    }),
          ],
        ),
        backgroundColor: Colors.purple,
      ),
    );
  }

  Future<void>? getStudentData() async {
    try {
      http.Response response;
      response =
          await http.get(Uri.parse("http://localhost/php-attempt1/read.php"));
      if (response.statusCode == 200) {
        //Converts URl to JSON string
        //print(response.body);
        var studentResponse = json.decode(response.body);
        var studentDataResponse = studentResponse["data"];
        //int success= studentResponse["success"];
        //if(success == 1){}
        //Above focuses on data part of list only.
        var newList = studentDataResponse
            .map((students) => StudentModel.fromJson(students))
            .toList();
        studentController.updateStudentList(newList);
        //Above maps data from endpoint
        //to objects we made on this file, then converts all that to a list.
        //jsonResponse.map((student) => StudentModel.fromJson(student)).toList();
      } else {
        throw "Unable to read contents";
      }
    } catch (exception) {
      print(exception.toString());
    }
    studentController.updateLoadingList(false);
  }
}
