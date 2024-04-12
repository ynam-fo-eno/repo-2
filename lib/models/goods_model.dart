// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

//import 'package:flutter/material.dart';

class ProductModel {
  var id;
  var p_name;
  var p_descr;
  var price;
  var image;
  var serial_no;
  var rating;
  //var created_at;

  ProductModel({
    required this.id,
    required this.p_name,
    required this.p_descr,
    required this.price,
    required this.image,
    required this.serial_no,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["id"],
        p_name: json["p_name"],
        p_descr: json["p_descr"],
        price: json["price"],
        image: json["image"],
        serial_no: json["serial_no"],
        rating: json["rating"]
      );
  }
}
