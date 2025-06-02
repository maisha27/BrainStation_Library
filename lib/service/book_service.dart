import 'dart:convert';
import 'package:http/http.dart' as http;
import '/model/model_dart.dart';

// services/book_service.dart
class BookService {
  static Future<Book> fetchBookById(int id) async {
    final url = Uri.parse('http://172.16.227.200:8000/books/$id');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Book.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load book');
    }
  }
}


