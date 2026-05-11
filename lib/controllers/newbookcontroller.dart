import 'dart:convert';
//import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:personal_library/configs/constants.dart';
import 'package:personal_library/models/new_book_model.dart';

class NewBookController extends GetxController {
  var newBooks = <NewBookModel>[].obs;
  var inProgressBooks = <NewBookModel>[].obs;
  var readBooks = <NewBookModel>[].obs;
  var populars = <NewBookModel>[].obs;
  var isLoading = true.obs;

  var allBooks = <NewBookModel>[].obs;
  var filteredBooks = <NewBookModel>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    fetchAllBooks();
    super.onInit();
  }

  void filterBooks(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredBooks.assignAll(allBooks);
    } else {
      filteredBooks.assignAll(
        allBooks
            .where(
              (book) =>
                  book.fullname.toLowerCase().contains(query.toLowerCase()),
            )
            .toList(),
      );
    }
  }

  void fetchAllBooks() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse("${AppConstants.apiUrl}/read_books.php"),
      );
      if (response.statusCode == 200) {
        var serverData = jsonDecode(response.body);
        var bookData = serverData["data"] as List;

        newBooks.value = bookData
            .where((b) => b["status"] == "new")
            .map((b) => NewBookModel.fromJson(b))
            .toList();
        inProgressBooks.value = bookData
            .where((b) => b["status"] == "in_progress")
            .map((b) => NewBookModel.fromJson(b))
            .toList();
        readBooks.value = bookData
            .where((b) => b["status"] == "read")
            .map((b) => NewBookModel.fromJson(b))
            .toList();
        populars.value = bookData
            .where((b) => b["status"] == "popular")
            .map((b) => NewBookModel.fromJson(b))
            .toList();
        allBooks.assignAll(
          bookData.map((b) => NewBookModel.fromJson(b)).toList(),
        );
        filteredBooks.assignAll(allBooks);
      } else {
        Get.snackbar("Error", "Failed to load books: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
