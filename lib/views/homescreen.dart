import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_library/configs/colors.dart';
import 'package:personal_library/configs/constants.dart';
import 'package:personal_library/controllers/newbookcontroller.dart';
import 'package:personal_library/views/selected_book_screen.dart';
import 'package:personal_library/widget/custom_type_indicator.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final controller = Get.put(NewBookController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.homeBackground,
        // ignore: avoid_unnecessary_containers
        body: SafeArea(
          child: Container(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Hi, Patience',
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Discover your books',
                        style: GoogleFonts.openSans(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 39,
                  margin: EdgeInsets.only(left: 25, right: 25, top: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondaryColor4,
                  ),
                  child: Stack(
                    children: <Widget>[
                      TextField(
                        onChanged: (value) => controller.filterBooks(value),
                        maxLengthEnforcement:
                            MaxLengthEnforcement.truncateAfterCompositionEnds,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 19,
                            right: 50,
                            bottom: 9,
                          ),
                          border: InputBorder.none,
                          hintText: 'Search book',
                          hintStyle: GoogleFonts.openSans(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: SvgPicture.asset(
                          'assets/svg/background_search.svg',
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 9,
                        child: SvgPicture.asset(
                          'assets/icons/icon_search_white.svg',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(left: 25),
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicatorPadding: EdgeInsets.all(0),
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    indicator: RoundedRectangleTabIndicator(
                      weight: 2,
                      width: 10,
                      color: Colors.black,
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 23),
                          child: Text('New'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 23),
                          child: Text('In progress'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 23),
                          child: Text('Read'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 21),
                  height: 210,
                  child: TabBarView(
                    children: [
                      // New Books Tab
                      Obx(() {
                        if (controller.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                          padding: EdgeInsets.only(left: 25, right: 6),
                          itemCount: controller.newBooks.length,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var book = controller.newBooks[index];
                            return GestureDetector(
                              onTap: () {
                                print("${book.fullname} tapped");
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 19),
                                height: 210,
                                width: 153,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black12,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      AppConstants.imageUrl + book.image,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                      // In Progress Books Tab
                      Obx(() {
                        if (controller.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                          padding: EdgeInsets.only(left: 25, right: 6),
                          itemCount: controller.inProgressBooks.length,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var book = controller.inProgressBooks[index];
                            return GestureDetector(
                              onTap: () {
                                print("${book.fullname} tapped");
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 19),
                                height: 210,
                                width: 153,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black12,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      AppConstants.imageUrl + book.image,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                      // Read Books Tab
                      Obx(() {
                        if (controller.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                          padding: EdgeInsets.only(left: 25, right: 6),
                          itemCount: controller.readBooks.length,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var book = controller.readBooks[index];
                            return GestureDetector(
                              onTap: () {
                                print("${book.fullname} tapped");
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 19),
                                height: 210,
                                width: 153,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black12,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      AppConstants.imageUrl + book.image,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 25),
                  child: Text(
                    "Popular",
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Obx(() {
                  // If user is searching, show filtered results instead
                  final isSearching = controller.searchQuery.value.isNotEmpty;
                  final booksToShow = isSearching
                      ? controller.filteredBooks
                      : controller.populars;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Show "Search Results" title when searching
                      if (isSearching)
                        Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                            top: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Search Results (${booksToShow.length})',
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      if (booksToShow.isEmpty)
                        Padding(
                          padding: EdgeInsets.only(left: 25, top: 20),
                          child: Text(
                            'No books found.',
                            style: GoogleFonts.openSans(color: Colors.grey),
                          ),
                        ),
                      ListView.builder(
                        padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: booksToShow.length,
                        itemBuilder: (context, index) {
                          var book = booksToShow[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectedBookScreen(
                                    key: UniqueKey(),
                                    popularNewBookModel: book,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 18),
                              height: 81,
                              width: MediaQuery.of(context).size.width - 50,
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 81,
                                    width: 62,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          AppConstants.imageUrl + book.image,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 21),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book.fullname,
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          book.author,
                                          style: GoogleFonts.openSans(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: <Widget>[
            Icon(Icons.home, size: 30, color: Colors.black),
            Icon(Icons.list, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
            if (index == 0) {
              Navigator.pushNamed(context, '/');
            } else if (index == 1) {
              Navigator.pushNamed(context, '/collections');
            } else if (index == 2) {
              Navigator.pushNamed(context, '/profile');
            }
          },
        ),
      ),
    );
  }
}
