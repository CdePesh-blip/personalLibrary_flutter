import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:personal_library/configs/constants.dart';
import 'package:personal_library/controllers/logincontroller.dart';
import 'package:personal_library/models/new_book_model.dart';

class SelectedBookScreen extends StatelessWidget {
  final NewBookModel popularNewBookModel;

  const SelectedBookScreen({
    required Key key,
    required this.popularNewBookModel,
  }) : super(key: key);

  Color _getStatusColor(String status) {
    switch (status) {
      case 'popular':
        return Color(0xFFFFD700);
      case 'new':
        return Color(0xFF90CAF9);
      case 'read':
        return Color(0xFFA5D6A7);
      case 'in_progress':
        return Color(0xFFFFAB91);
      default:
        return Color(0xFFCE93D8);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
          height: 49,
          color: Colors.black,
          child: ElevatedButton(
            onPressed: () async {
              try {
                final Logincontroller logincontroller = Get.find();
                final response = await http.get(
                  Uri.parse(
                    "http://192.168.1.72/library_api/add_to_library.php?user_id=${logincontroller.userId.value}&book_id=${popularNewBookModel.id}",
                  ),
                );
                if (response.statusCode == 200) {
                  final serverData = jsonDecode(response.body);
                  if (serverData['success'] == 1) {
                    Get.snackbar("Success", "Book added to library! 📚");
                  } else {
                    Get.snackbar("Info", serverData['message']);
                  }
                }
              } catch (e) {
                Get.snackbar("Error", "Something went wrong: $e");
              }
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Add to Library',
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: _getStatusColor(popularNewBookModel.status),
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: _getStatusColor(popularNewBookModel.status),
                    child: Stack(
                      children: <Widget>[
                        /*
                        Positioned(
                          left: 25,
                          top: 35,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                "/homescreen",
                              );
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: SvgPicture.asset(
                                'assets/svg/arrow-big-left.svg',
                              ),
                            ),
                          ),
                        ),
                        */
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 62),
                            width: 225,
                            height: 350,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  AppConstants.imageUrl +
                                      popularNewBookModel.image,
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 25),
                    child: Text(
                      popularNewBookModel.fullname,
                      style: GoogleFonts.openSans(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 25),
                    child: Text(
                      popularNewBookModel.author,
                      style: GoogleFonts.openSans(
                        fontSize: 27,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Ksh",
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          popularNewBookModel.price,
                          style: GoogleFonts.openSans(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.black,
                    tabs: [
                      Tab(text: 'Description'),
                      Tab(text: 'Reviews'),
                      Tab(text: 'Similar'),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          padding: EdgeInsets.all(25),
                          child: Text(
                            popularNewBookModel.description,
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: Colors.grey[800],
                              height: 1.8,
                            ),
                          ),
                        ),
                        ListView(
                          children: [
                            ListTile(
                              leading: CircleAvatar(child: Icon(Icons.person)),
                              title: Text(
                                "User Review",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "A wonderful read that changes your perspective on life.",
                              ),
                            ),
                          ],
                        ),
                        Center(child: Text('Similar books coming soon')),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
