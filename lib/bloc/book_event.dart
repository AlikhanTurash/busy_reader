part of 'book_bloc.dart';

@immutable
abstract class BookEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllData extends BookEvent {
  FetchAllData();
  @override
  List<Object> get props => [];
}

class LoadBooksEvent extends BookEvent {
  @override
  List<Object> get props => [];
}

class FilterBooksEvent extends BookEvent {
  @override
  List<Object> get props => [];
}

class UpdateBookEvent extends BookEvent {
  final Book updatedBook;

  UpdateBookEvent(this.updatedBook);

  @override
  List<Object> get props => [updatedBook];
}
