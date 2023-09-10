import 'package:event/widgets/constants.dart';
import 'package:event/login/Signup.dart';
import 'package:event/on-board/CustomOnBoardBody.dart';
import 'package:event/on-board/third.dart';
import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);
  static String routeName = "Second";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SignUp(),
              ),
            );
          },
          child: Text('Skip',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: kMainColor2)),
        ),
      ),
      body: CustomOnBoardBody(
        text: 'we care about all details of your events',
        imagePath: 'assets/images/img/onboard2.png',
        indicator: .66,
        onButtonClick: () {
          Navigator.pushNamed(context, Third.routeName);
        },
      ),
    );
  }
}
//
