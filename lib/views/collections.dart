import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:personal_library/models/collection_model.dart';
//import 'package:personal_library/models/collection_model.dart';

var myBookNames = [
  //CollectionModel("Holy Spirit my Senior Patner", "David Yonggi", image: "assets/images/Holy Spirit my senior Partner.jpg"),
  //CollectionModel("Obvious Adams", "Robert Updegraff", image: "assets/images/Obvious Adams.jpg"),
];

bool loaded = false;

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  @override
  void initState() {
    fetchBooks();
    super.initState();
  }

  void fetchBooks() async {
    var response = await http.get(Uri.parse(""));
    if (response.statusCode == 200) {
      var serverData = jsonDecode(response.body);
      var bookData = serverData["data"];

      for (var book in bookData) {
        myBookNames.add(
          CollectionModel(book["name"], book["author"], book["image"]),
        );
      }
      setState(() {
        loaded = true;
      });
    } else {
      Get.snackbar("Error", "Server Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return loaded
        ? // to ask if data is loaded
          ListView.builder(
            itemCount: myBookNames.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.network(
                    "https://localhost/library_api/Book_images/" +
                        myBookNames[index].image,
                    width: 100,
                    height: 100,
                  ),
                  Column(
                    children: [
                      Text(myBookNames[index].name),
                      Text(myBookNames[index].author),
                    ],
                  ),
                ],
              );
            },
          )
        : Center(child: CircularProgressIndicator());
  }
}
