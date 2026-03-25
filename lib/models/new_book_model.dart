import 'dart:ui';
import 'package:personal_library/configs/colors.dart';

class NewBookModel {
  final String title;
  final String image;
  final String author;
  final String description;
  final Color color;

  NewBookModel({
    required this.title,
    required this.image,
    required this.author,
    required this.description,
    required this.color,
  });
}

List<NewBookModel> newBooks = [
  NewBookModel(
    title: "Obvious Adams",
    author: "Robert R Updegraff",
    image: "assets/images/Obvious Adams.jpg",
    description: "",
    color: AppColors.primaryColor3,
  ),
];
