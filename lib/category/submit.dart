import 'package:event/widgets/Button.dart';
import 'package:event/confirmed.dart';
import 'package:event/widgets/constants.dart';
import 'package:flutter/material.dart';

class Submit extends StatelessWidget {
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: "Address",
                hintText: "Enter your address",
                hintStyle: TextStyle(color: Colors.black),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                prefixIcon: Icon(Icons.home_outlined, color:kMainColor),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: "Phone",
                hintText: "Enter your phone number",
                hintStyle: TextStyle(color: Colors.black),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                prefixIcon: Icon(Icons.phone, color:kMainColor),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 40,
            ),
            Button('Confirm', () {
              (phoneController.text.isEmpty || addressController.text.isEmpty)? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('submit Error'),
                    content: Text(
                        'it seems that address or phone number is empty. Please try again.'),
                    actions: [
                      Button('Ok', () {Navigator.of(context).pop();}),
                    ],
                  );
                },
              )
              :Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Confirmed()));
            })
          ],
        ),
      ),
    );
  }
}
