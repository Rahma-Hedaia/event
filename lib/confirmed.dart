import 'package:flutter/material.dart';

class Confirmed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/img/confirm.png'),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Your order has been confirmed successfully',style: Theme.of(context).textTheme.displayLarge,),
          )
        ],
      ),
    );
  }
}
