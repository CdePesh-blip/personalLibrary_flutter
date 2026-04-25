import 'dart:ui';
//import 'package:personal_library/configs/colors.dart';

class NewBookModel {
  final String fullname;
  final String image;
  final String author;
  final String description;
  final String price;
  //final Color color;
  final String status;

  NewBookModel({
    required this.fullname,
    required this.image,
    required this.author,
    required this.description,
    required this.price,
    //required this.color,
    required this.status,
  });

  factory NewBookModel.fromJson(Map<String, dynamic> json) {
    return NewBookModel(
      fullname: json['fullname'] ?? "No Title",
      image: json['image'] ?? "",
      author: json['author'] ?? "Unknown",
      description: json['description'] ?? "No description provided.",
      price: json['price'] ?? "0.00",
      //color: Color(int.parse(json['color'] ?? "0xFFFFFFFF")),
      status: json['status'] ?? "new",
    );
  }
}

// List<NewBookModel> newBooks = [
//   NewBookModel(
//     title: "Obvious Adams",
//     author: "Robert R Updegraff",
//     image: "assets/images/Obvious Adams.jpg",
//     description:
//         "A classic business parable about Oliver Adams, who succeeds in advertising by championing simplicity, common sense, and direct action over complex, flashy strategies.",
//     price: "1000",
//     color: AppColors.primaryColor3,
//     progress: 0.5,
//   ),
// ];

// List<NewBookModel> populars = [
//   NewBookModel(
//     title: "Atomic habits",
//     author: "James Clear",
//     image: "assets/images/Atomic Habits.jpg",
//     description:
//         "Tiny routines and behaviors that build on one another to multiply healthy habits.",
//     price: "1000",
//     color: AppColors.bookColor,
//     progress: 0.4,
//   ),
//   NewBookModel(
//     title: "Obvious Adams",
//     author: "Robert R Updegraff",
//     image: "assets/images/Obvious Adams.jpg",
//     description:
//         "A classic business parable about Oliver Adams, who succeeds in advertising by championing simplicity, common sense, and direct action over complex, flashy strategies.",
//     price: "1200",
//     color: AppColors.primaryColor3,
//     progress: 0.5,
//   ),
//   NewBookModel(
//     title: "No Longer Human",
//     image: "assets/images/No Longer Human.jpg",
//     author: "Osamu Dazai",
//     description:
//         "No Longer Human (Japanese: 人間失格, Hepburn: Ningen Shikkaku), also translated as A Shameful Life, is a 1948 novel by Japanese author Osamu Dazai. It tells the story of a troubled man incapable of revealing his true self to others, and who, instead, maintains a façade of hollow jocularity, later turning to a life of alcoholism and drug abuse before his final disappearance.",
//     price: "1400",
//     color: AppColors.primaryColor4,
//     progress: 0.6,
//   ),
//   NewBookModel(
//     title: "The Stranger",
//     image: "assets/images/Stranger, Albert Camus.jpg",
//     author: "Albert Camus",
//     description:
//         "No Longer Human (Japanese: 人間失格, Hepburn: Ningen Shikkaku), also translated as A Shameful Life, is a 1948 novel by Japanese author Osamu Dazai. It tells the story of a troubled man incapable of revealing his true self to others, and who, instead, maintains a façade of hollow jocularity, later turning to a life of alcoholism and drug abuse before his final disappearance.",
//     price: "1800",
//     color: AppColors.selectedScreenBackground,
//     progress: 0.7,
//   ),
// ];
