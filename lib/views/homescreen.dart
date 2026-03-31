import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_library/configs/colors.dart';
import 'package:personal_library/models/new_book_model.dart';
import 'package:personal_library/widget/custom_type_indicator.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsetsGeometry.only(left: 25, right: 25),
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
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicatorPadding: EdgeInsetsGeometry.all(0),
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
              ),
              Container(
                margin: EdgeInsets.only(top: 21),
                height: 210,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 25, right: 6),
                  itemCount: newBooks.length,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 19),
                      height: 210,
                      width: 153,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                        image: DecorationImage(
                          image: AssetImage(newBooks[index].image),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 25, top: 25),
                child: Text(
                  "Popular",
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: populars.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // ignore: avoid_print
                      print("ListView tapped");
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 18),
                      height: 81,
                      width: MediaQuery.of(context).size.width - 50,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 81,
                            width: 62,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(populars[index].image),
                              ),
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 21),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                populars[index].title,
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                populars[index].author,
                                style: GoogleFonts.openSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 5),
                              //Text(populars[index].progress)
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
    );
  }
}
