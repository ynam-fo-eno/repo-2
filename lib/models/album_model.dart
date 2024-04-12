// ignore_for_file: prefer_typing_uninitialized_variables

//import 'dart:convert';
class Album {
  final title;
  final image;

  Album({
    required this.title,
    required this.image,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(title: json["title"], image: json["thumbnailUrl"]);
  }
}
