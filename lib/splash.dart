import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:event/on-board/first.dart';
import 'package:flutter/material.dart';

class Splach extends StatefulWidget {
  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6, milliseconds: 500), () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> First())
      );
    });
  }



  Widget AnimatedText() {
    return AnimatedTextKit(

      totalRepeatCount: 1,
      animatedTexts: [
        TyperAnimatedText('Hello,We wish you a good day..',
            textStyle:TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            ) ),

      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink[100], ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: AnimatedText(),
              ),
            ],
          ),
        ),
      ),

    );
  }
}