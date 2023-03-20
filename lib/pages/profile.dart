import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Профиль",
              style:
                  GoogleFonts.mulish(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: SizedBox(
                    child: ClipOval(
                      child: Image.asset(
                        "assets/data/images/img.png",
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 200,
                  child: Text(
                    "Введите своё имя и при желании добавьте фото профиля",
                    style: GoogleFonts.mulish(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffebebeb),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Имя"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffebebeb),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Фамилия"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffebebeb),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Email"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffebebeb),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  labelText: "Номер телефона"),
            ),
            SizedBox(
              height: 180,
            )
          ]),
        ),
      ),
    );
  }
}
