import 'dart:ui';
import 'package:personal_library/configs/colors.dart';

class NewBookModel {
  final String title;
  final String image;
  final String author;
  final String description;
  final Color color;
  final double progress;

  NewBookModel({
    required this.title,
    required this.image,
    required this.author,
    required this.description,
    required this.color,
    required this.progress,
  });
}

List<NewBookModel> newBooks = [
  NewBookModel(
    title: "Obvious Adams",
    author: "Robert R Updegraff",
    image: "assets/images/Obvious Adams.jpg",
    description:
        "A classic business parable about Oliver Adams, who succeeds in advertising by championing simplicity, common sense, and direct action over complex, flashy strategies.",
    color: AppColors.primaryColor3,
    progress: 0.5,
  ),
];

List<NewBookModel> populars = [
  NewBookModel(
    title: "Atomic habits",
    author: "James Clear",
    image: "assets/images/Atomic Habits.jpg",
    description:
        "Tiny routines and behaviors that build on one another to multiply healthy habits.",
    color: AppColors.primaryColor2,
    progress: 0.4,
  ),
];
