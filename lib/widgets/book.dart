import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/book.dart';

class BookWidget extends StatelessWidget {
  final Book book;
  final Function()? onTapFav;
  final Function()? onTapDetail;

  const BookWidget({
    super.key,
    required this.onTapFav,
    this.onTapDetail,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapDetail,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Container(
          height: 115,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffF7F7F7),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 78,
                  width: 48,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(book.image),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        book.title,
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${book.year}",
                        style: GoogleFonts.montserrat(
                            color: const Color(0xff8C8C8C),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        book.author,
                        style: GoogleFonts.montserrat(
                            color: const Color(0xff595858),
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: onTapFav,
                      child: Icon(
                        book.isFav
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: Color(0xffFF2D20),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
