// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unnecessary_string_interpolations, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/controllers/logincontroller.dart';
import 'package:flutter_application_0/controllers/suggestion_controller.dart';
import 'package:flutter_application_0/models/suggestion_model.dart';
import 'package:flutter_application_0/views/pages/user_list.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

LoginController loginController = Get.put(LoginController());
SuggestionController thoughtController= Get.put(SuggestionController());

class UserProposals extends StatelessWidget {
  const UserProposals({super.key});
  @override
  Widget build(BuildContext context) {
    userThoughtsDisplay();
    TextEditingController suggestionController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: const CustomizedTextWidget(
                label: "ST4&&Y",
                labelsColor: textingGray,
                fontWeight: FontWeight.bold,
                fontSize: 40),
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
                   loginController.role.value == "1"
                    ? 
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: ((thoughtController.suggestionList.length) + 0),
                        itemBuilder: (context, index) {
                          return Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${index + 1}.${thoughtController.suggestionList[index].full_name}\n ${thoughtController.suggestionList[index].email}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: textingWhite,
                                            backgroundColor: textingGray,
                                          ),
                                        ),
                                        Text(
                                          "${thoughtController.suggestionList[index].suggestion}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: textingWhite,
                                            backgroundColor: textingGray,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20
                                        ),  
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      )
                    :
                  Column(
                    children: [
                      CustomizedTextWidget(
                        label: "You can make comments here: ",
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      TextField(
                        controller: suggestionController,
                        style: TextStyle(color: textingGray, fontSize: 18),
                        decoration: InputDecoration(
                          //hintTet: hintMessage,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blueGrey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: CustomizedTextWidget(
                          label: "Use strctly 120 characters please!.",
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          makeSuggestion(suggestionController.text);
                        },
                        child: Text("Send your suggestion!"),
                        color: buttonColor1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    
  }

  Future<void> makeSuggestion(userInput) async {
    http.Response reponse;
    var body = {
      "full_name":"${loginController.fullName.value}",
      "email":"${loginController.email.value}",
      "suggestion":"$userInput",
      
    };

    reponse = await http.post(
        Uri.parse("http://localhost/php-attempt1/get_user_thoughts.php"),
        body: body);
    if (reponse.statusCode == 200) {
      var data = json.decode(reponse.body);
      int orderStatus = data["Success!"];
      if (orderStatus == 1) {
        Fluttertoast.showToast(
            msg: "Suggestion received!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Sorry, working on receiving your suggestion.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> userThoughtsDisplay() async {
    http.Response reponse =
        await http.get(Uri.parse("http://localhost/php-attempt1/show_user_thoughts.php"));
    if (reponse.statusCode == 200) {
      var serverResponse = json.decode(reponse.body);
      var grievanceResponse = serverResponse["data"];
      var grievanceList =
          grievanceResponse.map((grievance) => SuggestionModel.fromJson(grievance)).toList();
      thoughtController.updateSuggestionList(grievanceList);
    } else {
      Text("Error");
    }
  }
}
