import 'package:bloc/bloc.dart';
import 'package:busy_reader/helpers/load_data.dart';
import 'package:busy_reader/models/book.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final Box<Book> bookBox;
  List<Book> books = [];
  BookBloc(this.bookBox) : super(BookLoadingState()) {
    on<LoadBooksEvent>((event, emit) async {
      try {
        List<Book> books = bookBox.values.toList();
        if (books.isEmpty) {
          await Helpers.importBooksFromJson(bookBox);
          books = bookBox.values.toList();
        }
        emit(BookLoadedState(books: books));
      } catch (e) {
        emit(BookErrorState(message: e.toString()));
      }
    });

    on<UpdateBookEvent>((event, emit) async {
      try {
        final updatedBook = event.updatedBook;
        final bookIndex = bookBox.values
            .toList()
            .indexWhere((book) => book.title == updatedBook.title);
        if (bookIndex >= 0) {
          await bookBox.putAt(bookIndex, updatedBook);
        }
        final books = bookBox.values.toList();
        emit(BookLoadedState(books: books));
      } catch (e) {
        emit(BookErrorState(message: 'Error updating book'));
      }
    });

    on<FilterBooksEvent>((event, emit) async {
      try {
        final books = state.books.where((book) => book.isFav).toList();
        emit(BookLoadedState(books: books));
      } catch (e) {
        emit(BookErrorState(message: 'Error updating book'));
      }
    });
  }

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is FilterBooksEvent) {
      final books = state.books.where((book) => book.isFav).toList();
      emit(BookLoadedState(books: books));
    }
    if (event is UpdateBookEvent) {
      try {
        final updatedBook = event.updatedBook;
        final bookIndex = bookBox.values
            .toList()
            .indexWhere((book) => book.title == updatedBook.title);
        if (bookIndex >= 0) {
          await bookBox.putAt(bookIndex, updatedBook);
        }
        final books = bookBox.values.toList();
        yield BookLoadedState(books: books);
      } catch (e) {
        yield BookErrorState(message: 'Error updating book');
      }
    }
  }
}
