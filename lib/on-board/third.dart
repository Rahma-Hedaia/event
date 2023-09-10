import 'package:event/login/Signup.dart';
import 'package:event/on-board/CustomOnBoardBody.dart';
import 'package:flutter/material.dart';

class Third extends StatelessWidget {
  static String routeName = "Third";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: CustomOnBoardBody(text: 'we have fast shipping',
        imagePath: 'assets/images/img/onboard3.png',indicator: 1,
        onButtonClick: (){Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>  SignUp(),
                  ),
                );},)
    );
  }
}
