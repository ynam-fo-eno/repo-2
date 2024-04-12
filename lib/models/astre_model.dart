// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

//import 'package:flutter/material.dart';

class StarModel {
  var id;
  var star_name;
  var continents;
  var dist_earth;
  var star_image;
  //var created_at;

  StarModel({
    required this.id,
    required this.star_name,
    required this.continents,
    required this.dist_earth,
    required this.star_image,
  });

  factory StarModel.fromJson(Map<String, dynamic> json) {
    return StarModel(
        id: json["id"],
        star_name: json["star_name"],
        continents: json["continents"],
        dist_earth: json["dist_earth"],
        star_image: json["star_image"],
    );
  }
}
