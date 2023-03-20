part of 'book_bloc.dart';

@immutable
abstract class BookState extends Equatable {
  get books => null;
}

class BookInitial extends BookState {
  @override
  List<Object?> get props => [];
}

class FavouriteBooks extends BookState {
  final List<Book> books;

  FavouriteBooks(this.books);

  @override
  List<Object?> get props => books;
}

class BookLoadingState extends BookState {
  BookLoadingState();

  @override
  List<Object?> get props => [];
}

class BookLoadedState extends BookState {
  final List<Book> books;

  BookLoadedState({required List<Book> this.books});

  @override
  List<Object?> get props => books;
}

class BookErrorState extends BookState {
  final String message;

  BookErrorState({required String this.message});
  @override
  List<Object?> get props => [];
}
