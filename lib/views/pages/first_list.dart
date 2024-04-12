// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:convert';

import 'package:flutter_application_0/models/album_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FirstList extends StatelessWidget {
  const FirstList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAlbum(),
        builder: (context, data) {
          if (data.hasData) {
            return ListView.builder(
              itemCount: data.data?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(data.data![index].title),
                    Image.network(data.data![index].image),
                  ],
                );
              },
            );
          } else {
            throw "Data not found!";
          }
        },
      ),
    );
  }

  Future<List<Album>> getAlbum() async {
    var reponse = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (reponse.statusCode == 200) {
      //Converts URl to JSON string
      List jsonReponse = json.decode(reponse.body);
      return jsonReponse.map((album) => Album.fromJson(album)).toList();
    } else {
      throw "Unable to read contents";
    }
  }
}
