import 'dart:convert';
import 'package:http/http.dart' as http;
import '/Models/books.dart';

class BookService {
  static const String _baseUrl = 'http://172.16.227.200:8000/books/';

  static Future<List<Book>> getBooks() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body);
        return jsonData.map((item) => Book.fromJson(item)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}