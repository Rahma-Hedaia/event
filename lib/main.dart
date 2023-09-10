import 'package:event/splash.dart';
import 'package:event/widgets/constants.dart';
import 'package:event/home.dart';
import 'package:event/on-board/second.dart';
import 'package:event/on-board/third.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          // bodyText1: myTextStyle,
          displayLarge: GoogleFonts.lato(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
          bodyLarge: GoogleFonts.satisfy(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: kMainColor
          ),
        ),
      ),
      home: Splach(),
      routes: {
        Second.routeName:(context) => Second(),
        Third.routeName:(context)=>Third(),
        Home.routeName:(context)=>Home()
      },
    );
  }
}
