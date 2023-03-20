import 'dart:convert';
import 'package:hive/hive.dart';

import '../models/book.dart';

import 'package:flutter/services.dart' show rootBundle;

class Helpers {
  static Future<void> importBooksFromJson(Box<Book> box) async {
    final jsonString = await rootBundle.loadString('assets/data/books.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    for (final json in jsonList) {
      final book = Book.fromJson(json);
      await box.add(book);
    }
  }
}
