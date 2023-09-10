import 'package:event/widgets/Button.dart';
import 'package:event/category/image.dart';
import 'package:event/category/submit.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<String> cartItems = [];

  void removeFromCart(String item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  late List<Image1> parameters =[];
  @override
  Widget build(BuildContext context) {
   parameters  = ModalRoute.of(context)!.settings.arguments as List<Image1>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[50],
        title: Text('Shopping Cart',
          style: TextStyle(
              color: Colors.grey
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  for(int i=0;i<parameters.length;i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage('${parameters[i].img}'),
                                    fit: BoxFit.cover)),
                          ),
                          Text('${parameters[i].price}'),
                          Icon(Icons.remove_circle)
                        ],
                      ),
                    ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(' Total price  = ${price()}',style: Theme.of(context).textTheme.displayLarge),
                  Text(' Price after 10 % discount = ${priceAfterDiscount()}',style: Theme.of(context).textTheme.displayLarge),
                ],
              ),
            ),
            Button('Continue', () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Submit()));
            })
          ],
        ),
      )
    );
  }
  double price(){
    double totalPrice = 0;
    for(int i=0;i<parameters.length;i++){
      totalPrice +=parameters[i].price;
    }
    return totalPrice;
  }
  double priceAfterDiscount(){
    double totalPrice = price() * .9;

    return totalPrice;
  }
}
