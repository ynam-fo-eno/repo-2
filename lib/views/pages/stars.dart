// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/controllers/astre_controller.dart';
import 'package:flutter_application_0/models/astre_model.dart';
//import 'package:flutter_application_0/views/widgets/customizedtext.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

StarController starController = Get.put(StarController());

class Stars extends StatelessWidget {
  const Stars({super.key});

  @override
  Widget build(BuildContext context) {
    starDisplay();
    return Obx(
      () => ListView.builder(
          shrinkWrap: true,
          itemCount: ((starController.starList.length) + 0),
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
                        "http://localhost/php-attempt1/star_images/${starController.starList[index].star_image}",
                        height: 100,
                        width: 100,
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Name:\n${starController.starList[index].star_name}",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.purple,
                                  backgroundColor: textingGray,
                                ),
                                maxLines: 2,
                              ),
                              //Spacer(),
                              Text(
                                starController.starList[index].continents,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: textingWhite,
                                  backgroundColor: textingGray,
                                ),
                                maxLines: 5,
                              ),
                              //Spacer(),
                              Text(
                                "Distance from Earth=\n${starController.starList[index].dist_earth}\nlight years",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.purple,
                                  backgroundColor: textingGray,
                                ),
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      MaterialButton(
                        onPressed: () {},
                        child: Text("Learn More"),
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Future<void> starDisplay() async {
    http.Response reponse = await http
        .get(Uri.parse("http://localhost/php-attempt1/display_stars.php"));
    if (reponse.statusCode == 200) {
      var serverResponse = json.decode(reponse.body);
      var astreResponse = serverResponse["stars & constellations"];
      var starList =
          astreResponse.map((star) => StarModel.fromJson(star)).toList();
      starController.updateStarList(starList);
    } else {
      Text("Error");
    }
  }
}
