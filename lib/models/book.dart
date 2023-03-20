import 'package:hive/hive.dart';

part 'book.g.dart';

@HiveType(typeId: 0)
class Book {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String author;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final int year;

  @HiveField(4)
  final String description;
  @HiveField(5)
  bool isFav;

  Book({
    required this.isFav,
    required this.year,
    required this.title,
    required this.author,
    required this.image,
    required this.description,
  });
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      isFav: false,
      year: json['year'],
      title: json['title'],
      author: json['author'],
      image: json['image'],
      description: json['description'],
    );
  }

  Book copyWith({
    bool? isFav,
    int? year,
    String? title,
    String? author,
    String? image,
    String? description,
  }) {
    return Book(
      isFav: isFav ?? this.isFav,
      year: year ?? this.year,
      title: title ?? this.title,
      author: author ?? this.author,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }
}

class BookAdapter extends TypeAdapter<Book> {
  @override
  final int typeId = 0;

  @override
  Book read(BinaryReader reader) {
    final year = reader.readInt();
    final title = reader.readString();
    final author = reader.readString();
    final image = reader.readString();
    final description = reader.readString();
    final isFav = reader.readBool();

    return Book(
      isFav: isFav,
      year: year,
      title: title,
      author: author,
      image: image,
      description: description,
    );
  }

  @override
  void write(BinaryWriter writer, Book book) {
    writer.writeInt(book.year);
    writer.writeString(book.title);
    writer.writeString(book.author);
    writer.writeString(book.image);
    writer.writeString(book.description);
    writer.writeBool(book.isFav);
  }
}
