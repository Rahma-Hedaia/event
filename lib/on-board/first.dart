import 'package:event/widgets/constants.dart';
import 'package:event/login/Signup.dart';
import 'package:event/on-board/CustomOnBoardBody.dart';
import 'package:event/on-board/second.dart';
import 'package:flutter/material.dart';
class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);
  static String routeName = "First";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
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
      body: CustomOnBoardBody(text: 'You can find varity of products for many events here',
        imagePath: 'assets/images/img/onboard1.png',indicator: .33,
        onButtonClick: (){Navigator.pushNamed(context, Second.routeName);},),
    );
  }
}
