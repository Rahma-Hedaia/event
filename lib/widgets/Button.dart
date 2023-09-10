import 'package:event/widgets/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  late String button_name;
  late Function() onButtonClick;
  Button( this.button_name, this.onButtonClick);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onButtonClick,
      child: Text(
        "$button_name",
        style: TextStyle(color: Colors.white,fontSize: 22),
      ),
      style: ElevatedButton.styleFrom(
        //Colors.pink[50]
          primary: kMainColor,
          fixedSize: const Size(150, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50))),
    );
  }
}
