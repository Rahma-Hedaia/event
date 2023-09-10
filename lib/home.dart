import 'package:event/widgets/AssetManager.dart';
import 'package:event/category/CategoryModel.dart';
import 'package:event/category/engagement.dart';
import 'package:event/widgets/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    List<CategoryModel> Category = [
      CategoryModel(
          img: AssetManager.engagement,
          title: "ENGAGEMENT",
          on: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Engagemant()));
          }),
      CategoryModel(img: AssetManager.birthday, title: "BIRTHDAY", on: () {}),
      CategoryModel(
          img: AssetManager.graduation, title: 'GRADUATION', on: () {}),
    ];
    Widget CategoryWidget() {
      return Container(
        height: 600,
        width: 800,
        child: ListView.builder(
          itemCount: Category.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                // onpreased by index category1
                InkWell(
                  onTap: Category[index].on,
                  child: Container(
                    width: 300,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Container(
                          height: 10.0,
                          color: Colors.transparent,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            //main
                            child: Container(
                              width: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("${Category[index].img}"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.pink[100],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blueGrey,
                                    blurRadius: 5.0, // soften the shadow
                                    spreadRadius: 1.5, //extend the shadow
                                    offset: Offset(
                                      1.0,
                                      1.0,
                                    ),
                                  )
                                ],
                              ),
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Text(
                                      "${Category[index].title}",
                                      style: Theme.of(context).textTheme.displayLarge,
                                      // style: TextStyle(
                                      //     color: Colors.black,
                                      //     fontSize: 25,
                                      //     fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    }
    return Scaffold(
      drawer: Drawer(
        backgroundColor: kMainColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: kMainColor, // Set the desired background color
              ),
              accountName: Text(email.split('@').first),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/img/profileImage.jpeg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home',style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings',style: TextStyle(color: Colors.white)),
              onTap: () {
                // Handle menu item tap
              },
            ),
          ],
        ),
      ),
      backgroundColor: kMainColor2,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
                height: 50,
                child: Center(
                  child: Text(
                    "Categories",
                    style: Theme.of(context).textTheme.displayLarge,
                    // style: TextStyle(
                    //     color: Colors.black,
                    //     shadows: <Shadow>[
                    //       Shadow(
                    //         offset: Offset(4.0, 4.0),
                    //         blurRadius: 3.0,
                    //         color: Colors.grey,
                    //       ),
                    //     ],
                    //     fontSize: 30,
                    //     fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
