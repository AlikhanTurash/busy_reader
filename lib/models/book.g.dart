// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookAdapterr extends TypeAdapter<Book> {
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
