import 'package:busy_reader/pages/books.dart';
import 'package:busy_reader/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/book_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool appBarVisible = true;

class _HomePageState extends State<HomePage> {
  int _currentSelectedScreen = 0;
  final List<Widget> _screens = [
    BooksPage(
      favPage: false,
    ),
    Container(
      child: const Center(
        child: Text("Search"),
      ),
    ),
    BooksPage(
      favPage: true,
    ),
    Container(
      child: const Center(
        child: ProfilePage(),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xffFFFFFF),
      appBar: appBarVisible == true
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              foregroundColor: Colors.black,
              title: Text(
                "Рекомендации",
                style: GoogleFonts.mulish(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Center(
                      child: Text(
                    "Все книги",
                    style: GoogleFonts.mulish(
                        color: const Color(0xff8C8C8C),
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  )),
                )
              ],
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Главная",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Поиск",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: "Избранное",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Профиль",
          ),
        ],
        selectedFontSize: 10,
        unselectedFontSize: 10,
        backgroundColor: const Color(0xffFFFFFF),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (value) {
          setState(() {
            _currentSelectedScreen = value;
            if (value < 3) {
              appBarVisible = true;
            } else {
              appBarVisible = false;
            }
          });
        },
        currentIndex: _currentSelectedScreen,
      ),
      body: _screens[_currentSelectedScreen],
    );
  }
}
