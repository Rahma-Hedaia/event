import 'package:event/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomOnBoardBody extends StatelessWidget {
late String text;
late String imagePath;
late double indicator;
late Function() onButtonClick;
CustomOnBoardBody({this.text = '', this.imagePath= '', this.indicator = 0,required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 4,
          ),
          Image.asset(imagePath),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 15.75, fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 4,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: onButtonClick,
              child: CircularPercentIndicator(
                radius: 50,
                backgroundColor: Colors.white,
                lineWidth: 5,
                percent: indicator,
                progressColor: kMainColor,
                center: Icon(Icons.arrow_forward,
                    color: kMainColor, size: 35),
              ),
            ),
          ),
          //firstOnBoardButton.png
        ],
      ),
    );
  }
}
