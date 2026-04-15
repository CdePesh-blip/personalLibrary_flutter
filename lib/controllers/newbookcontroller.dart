import 'dart:convert';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:personal_library/models/new_book_model.dart';

class NewBookController extends GetxController {
  var newBooks = <NewBookModel>[].obs;
  var inProgressBooks = <NewBookModel>[].obs;
  var readBooks = <NewBookModel>[].obs;
  var populars = <NewBookModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNewBooks();
    fetchPopularBooks();
    super.onInit();
  }

  void fetchNewBooks() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse("http://localhost/library_api/read_books.php"),
      );
      if (response.statusCode == 200) {
        var serverData = jsonDecode(response.body);
        var bookData = serverData["data"] as List;

        newBooks.value = bookData
            .where((book) => book["status"] == "new")
            .map((book) => NewBookModel.fromJson(book))
            .toList();

        inProgressBooks.value = bookData
            .where((book) => book["status"] == "in progress")
            .map((book) => NewBookModel.fromJson(book))
            .toList();

        readBooks.value = bookData
            .where((book) => book["status"] == "read")
            .map((book) => NewBookModel.fromJson(book))
            .toList();
        print("Loaded ${newBooks.length} new books");
        print("Loaded ${inProgressBooks.length} in progress books");
        print("Loaded ${readBooks.length} read books");
      } else {
        print("Failed to load books. Status: ${response.statusCode}");
        Get.snackbar(
          "Error",
          "Failed to load new books: ${response.statusCode}",
        );
      }
    } catch (e) {
      print("Fetch error: $e");
      Get.snackbar("Error", "Error: $e");
    } finally {
      isLoading(false);
    }
  }

  void fetchPopularBooks() async {
    try {
      var response = await http.get(
        Uri.parse("http://localhost/library_api/read_books.php"),
      );
      if (response.statusCode == 200) {
        var serverData = jsonDecode(response.body);
        var bookData = serverData["data"] as List;

        populars.value = bookData
            .where((book) => book["status"] == "popular") // 1. Filter first
            .map(
              (book) => NewBookModel.fromJson(book),
            ) // 2. Use factory to create model
            .toList();

        print("Loaded ${populars.length} popular books");
      }
    } catch (e) {
      print("Error fetching popular books: $e");
    }
  }
}
