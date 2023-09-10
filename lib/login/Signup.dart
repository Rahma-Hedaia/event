import 'package:event/widgets/Button.dart';
import 'package:event/bloc/userData/DataLogic.dart';
import 'package:event/bloc/userData/DataState.dart';
import 'package:event/widgets/constants.dart';
import 'package:event/login/Signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignUp extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController1 = TextEditingController();

  TextEditingController passwordController2 = TextEditingController();

  final List<dynamic> parameters = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => UserLogic()),
      child: BlocConsumer<UserLogic, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          UserLogic userLogic = BlocProvider.of(context);
          userLogic.CreateDataBaseAndTable();

          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    TextFormField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        labelText: "Full name",
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(color: Colors.black),
                        border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                        prefixIcon: Icon(Icons.person, color: kMainColor),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter valid email",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        prefixIcon: Icon(Icons.email, color: kMainColor),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        labelText: "phone number",
                        hintText: "Enter your phone number",
                        hintStyle: TextStyle(color: Colors.black),
                        border:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                        prefixIcon: Icon(Icons.phone_android, color: kMainColor),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passwordController1,
                      decoration: InputDecoration(
                        labelText: "password",
                        hintText: "Enter strong password",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        prefixIcon:
                        Icon(Icons.password_outlined, color: kMainColor),
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Button(
                      'SignUp',
                          () {
                        userLogic.insertData(
                            email: '${emailController.text}',
                            password: '${passwordController1.text}');
                        for (int i = 0; i < userLogic.users.length; i++) {
                          print(userLogic.users[i]);
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                            settings: RouteSettings(arguments: parameters),
                          ),
                        );
                          },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        for (int i = 0; i < userLogic.users.length; i++){
                          parameters.add(userLogic.users[i]);
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                            settings: RouteSettings(arguments: parameters),
                          ),
                        );
                      },
                      child: Text(
                        "already have account ? sign in",
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
