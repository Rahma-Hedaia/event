import 'package:event/home.dart';
import 'package:event/widgets/Button.dart';
import 'package:event/widgets/constants.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController1 = TextEditingController();
 late List<dynamic>  parameters =[];
  @override
  Widget build(BuildContext context) {

    parameters  = ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                'Login',
                    () {
                  //for (int i = 0; i < parameters.length; i++) {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                            settings: RouteSettings(arguments: emailController.text),
                          ),
                        );
                     // ((parameters[i]['email'] ==
                     //    emailController.text) &&
                     //    (parameters[i]['password'] ==
                     //        passwordController1.text))?Navigator.push(
                     //   context,
                     //   MaterialPageRoute(
                     //     builder: (context) => Home(),
                     //     settings: RouteSettings(arguments: emailController.text),
                     //   ),
                     // ):
                     //  showDialog(
                     //    context: context,
                     //    builder: (BuildContext context) {
                     //      return AlertDialog(
                     //        title: Text('Login Error'),
                     //        content: Text(
                     //            'Wrong email or password. Please try again.'),
                     //        actions: [
                     //          Button('Ok', () {Navigator.of(context).pop();}),
                     //        ],
                     //      );
                     //    },
                     //  );
                 // }
                },
              ),
            ],
          ),
        ),
      ),
    );

    //   BlocProvider(
    //   create: ((context) => UserLogic()),
    //   child: BlocConsumer<UserLogic, UserState>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
    //       UserLogic userLogic = BlocProvider.of(context);
    //       userLogic.CreateDataBaseAndTable();
    //
    //       return Scaffold(
    //         body: SingleChildScrollView(
    //           child: Padding(
    //             padding: const EdgeInsets.all(12.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 TextFormField(
    //                   controller: emailController,
    //                   decoration: InputDecoration(
    //                     labelText: "Email",
    //                     hintText: "Enter valid email",
    //                     hintStyle: TextStyle(color: Colors.black),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(25)),
    //                     prefixIcon: Icon(Icons.email, color: Colors.purple),
    //                   ),
    //                   style: TextStyle(color: Colors.black),
    //                 ),
    //                 SizedBox(
    //                   height: 15,
    //                 ),
    //                 TextFormField(
    //                   controller: passwordController1,
    //                   decoration: InputDecoration(
    //                     labelText: "password",
    //                     hintText: "Enter strong password",
    //                     hintStyle: TextStyle(color: Colors.black),
    //                     border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(25)),
    //                     prefixIcon:
    //                         Icon(Icons.password_outlined, color: Colors.purple),
    //                   ),
    //                   style: TextStyle(color: Colors.black),
    //                 ),
    //                 SizedBox(
    //                   height: 40,
    //                 ),
    //                 Button(
    //                   'Login',
    //                   () {
    //                     Navigator.pushNamed(context, Home.routeName);
    //                     print('_____________');
    //                     for (int i = 0; i < userLogic.users.length; i++) {
    //                       print(userLogic.users[i]['email']);
    //                       print(userLogic.users[i]['password']);
    //
    //                       if ((userLogic.users[i]['email'] ==
    //                               emailController.text) &&
    //                           (userLogic.users[i]['password'] ==
    //                               passwordController1.text)) {
    //                         Navigator.pushNamed(context, Home.routeName);
    //                       } else {
    //                         showDialog(
    //                           context: context,
    //                           builder: (BuildContext context) {
    //                             return AlertDialog(
    //                               title: Text('Login Error'),
    //                               content: Text(
    //                                   'Wrong email or password. Please try again.'),
    //                               actions: [
    //                                 ElevatedButton(
    //                                   child: Text('OK'),
    //                                   onPressed: () {
    //                                     // Close the dialog
    //                                     Navigator.of(context).pop();
    //                                   },
    //                                   style: ElevatedButton.styleFrom(
    //                                       primary: Colors.purple,
    //                                       //fixedSize: const Size(300, 50),
    //                                       shape: RoundedRectangleBorder(
    //                                           borderRadius:
    //                                               BorderRadius.circular(50))),
    //                                 ),
    //                               ],
    //                             );
    //                           },
    //                         );
    //                       }
    //                     }
    //                   },
    //                 ),
    //                 SizedBox(
    //                   height: 20,
    //                 ),
    //                 SizedBox(
    //                   height: 20,
    //                 ),
    //                 for (int i = 0; i < userLogic.users.length; i++)
    //                   Card(
    //                     child: Row(
    //                       children: [
    //                         Text(userLogic.users[i]['email'].toString()),
    //                         Spacer(),
    //                         Text(userLogic.users[i]['password'].toString())
    //                       ],
    //                     ),
    //                   )
    //               ],
    //             ),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
