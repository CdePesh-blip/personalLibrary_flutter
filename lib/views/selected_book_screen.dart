import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_library/configs/colors.dart';
import 'package:personal_library/models/new_book_model.dart';

import 'package:personal_library/widget/custom_type_indicator.dart';

class SelectedBookScreen extends StatelessWidget {
  final NewBookModel popularNewBookModel;

  const SelectedBookScreen({
    required Key key,
    required this.popularNewBookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 49,
        color: Colors.black,
        child: ElevatedButton(
          onPressed: () {},

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
              backgroundColor: AppColors.selectedScreenBackground,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              flexibleSpace: Container(
                color: popularNewBookModel.color,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: <Widget>[
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 62),
                        width: 225,
                        height: 172,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(popularNewBookModel.image),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 25),
                  child: Text(
                    popularNewBookModel.title,
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
                Container(
                  height: 28,
                  margin: EdgeInsets.only(top: 23, bottom: 36),
                  padding: EdgeInsets.only(left: 25),
                  child: DefaultTabController(
                    length: 3,
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
                        color: Colors.black,
                        weight: 2,
                        width: 30,
                      ),
                      tabs: [
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 39),
                            child: Text('Description'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 39),
                            child: Text('Reviews'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 39),
                            child: Text('Similar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                  child: Text(
                    "This book tells the story of Obvious Adams, who started his career working in a grocery store and later became a famous advertising executive. It describes how as a young man, Adams was inspired by a talk from advertising executive James Oswald and boldly went to Oswald's office seeking a job, though Oswald initially doubted Adams' potential; however, Adams persevered and ultimately found success in advertising.",
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                      height: 2,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
