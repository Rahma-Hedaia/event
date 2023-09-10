import 'package:event/cart.dart';
import 'package:event/widgets/constants.dart';
import 'package:event/home.dart';
import 'package:event/category/image.dart';
import 'package:event/profile.dart';
import 'package:flutter/material.dart';

class Engagemant extends StatefulWidget {
  @override
  State<Engagemant> createState() => _EngagemantState();
}

class _EngagemantState extends State<Engagemant> {
  final List<Image1> parameters = [];

  List<Image1> images1 = [
    Image1(img: 'assets/images/img/c1.jpg', price: 500),
    Image1(img: 'assets/images/img/c2.jpg', price: 600),
    Image1(img: 'assets/images/img/c3.jpg', price: 650),
    Image1(img: 'assets/images/img/c4.jpg', price: 700),
    Image1(img: 'assets/images/img/c5.jpg', price: 450)
  ];

  int _currentIndex = 0;

  final List<Widget> _screens = [
    Home(),
    ProfileScreen(),
  ];

  List<Widget> tabs = [Engagemant(), Engagemant(), Engagemant()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: TextFormField(
          decoration: InputDecoration(
            labelText: "search",
            prefixIcon: Icon(Icons.search, color: kMainColor),
          ),
          style: TextStyle(color: kMainColor),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.shopping_cart, size: 30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingCartScreen(),
                      settings: RouteSettings(arguments: parameters),
                    ),
                  );
                },
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kMainColor3,
        unselectedItemColor: kMainColor2,
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.chalet_sharp), label: 'Decoration'),
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: 'Cake'),
          BottomNavigationBarItem(
              icon: Icon(Icons.circle), label: 'Tray&Stands'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < images1.length; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: (Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 200,
                      width: 260,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage('${images1[i].img}'),
                              fit: BoxFit.cover)),
                    ),
                    Text(
                      '${images1[i].price}',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ShoppingCartScreen() as String,
                              arguments: images1[i].price);
                        },
                        child: IconButton(
                          icon: Icon(
                            Icons.add_box_outlined,
                            size: 35,
                          ),
                          onPressed: () {
                            parameters.add(Image1(
                                img: images1[i].img, price: images1[i].price));
                          },
                        ))
                  ],
                )),
              )
          ],
        ),
      ),
    );
  }
}
