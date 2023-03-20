import 'package:busy_reader/models/book.dart';
import 'package:busy_reader/pages/book_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../bloc/book_bloc.dart';
import '../widgets/book.dart';

class BooksPage extends StatefulWidget {
  BooksPage({super.key, required this.favPage});

  final bool favPage;
  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookBloc(Hive.box<Book>('books'))..add(LoadBooksEvent()),
      child: Scaffold(
        body: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) {
            if (state is BookLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is BookLoadedState) {
              final books = widget.favPage
                  ? state.books.where((book) => book.isFav).toList()
                  : state.books;

              return books.isEmpty
                  ? const Center(
                      child: Text("No books to show"),
                    )
                  : ListView.builder(
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final book = books[index];
                        return BookWidget(
                          book: book,
                          onTapFav: () {
                            BlocProvider.of<BookBloc>(context).add(
                                UpdateBookEvent(
                                    book.copyWith(isFav: !book.isFav)));
                          },
                          onTapDetail: () {
                            BottomDialog(
                                    book, BlocProvider.of<BookBloc>(context))
                                .showBottomDialog(context);
                          },
                        );
                      },
                    );
            } else {
              return const Center(
                child: Text('Error loading books'),
              );
            }
          },
        ),
      ),
    );
  }
}
