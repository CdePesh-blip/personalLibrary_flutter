import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:personal_library/models/collection_model.dart';

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  var myBookNames = [
    //CollectionModel("Holy Spirit my Senior Patner", "David Yonggi", image: "assets/images/Holy Spirit my senior Partner.jpg"),
    //CollectionModel("Obvious Adams", "Robert Updegraff", image: "assets/images/Obvious Adams.jpg"),
  ];

  bool loaded = false;
  @override
  void initState() {
    fetchBooks();
    super.initState();
  }

  void fetchBooks() async {
    try {
      var response = await http.get(
        Uri.parse("http://10.7.13.20/library_api/read_books.php"),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("RAW RESPONSE: ${response.body}");

      if (response.statusCode == 200) {
        var serverData = jsonDecode(response.body);
        var bookData = serverData["data"];

        for (var book in bookData) {
          myBookNames.add(
            CollectionModel(book["fullname"], book["author"], book["image"]),
          );
        }
        setState(() {
          loaded = true;
        });
      } else {
        Get.snackbar("Error", "Server Error: ${response.statusCode}");
        setState(() {
          loaded = true;
        });
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load books: $e");
      setState(() {
        loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return !loaded
        ? // to ask if data is loaded
          const Center(
            child: CircularProgressIndicator(),
          ) // Shows a spinner while loading
        : myBookNames.isEmpty
        ? const Center(child: Text("Your collection is empty"))
        : ListView.builder(
            itemCount: myBookNames.length,
            itemBuilder: (context, index) {
              //child:
              SvgPicture.asset('assets/svg/arrow-big-left.svg');

              return Container(
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.network(
                      "http://10.7.13.20/library_api/Book_images/" +
                          myBookNames[index].image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.book, size: 90);
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            myBookNames[index].fullname,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            myBookNames[index].author,
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
    //: Center(child: CircularProgressIndicator());
  }
}
