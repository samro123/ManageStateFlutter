import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnitureapp/constants.dart';
import 'package:furnitureapp/models/shop.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  void removeFromCart(Product product, BuildContext context){
    final shop = context.read<Shop>();
    shop.removeFromCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, child) => Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: kDefaultPadding),
          icon: SvgPicture.asset('assets/icons/back.svg', color: Colors.white,) ,
          onPressed: (){
          Navigator.pop(context);
        },),
        title: Text(
          'Back',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          value.cart.isEmpty
          ? Center(child: Text('No Products', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),)
          :Expanded(
              child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                      // get product from cart
                    final Product product = value.cart[index];

                    final String productName = product.title;

                    final int productPrice = product.price;

                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: ListTile(
                        title: Text(productName,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        subtitle: Text('\$${productPrice}', style: TextStyle(color: Colors.grey[200]),),
                        trailing: IconButton(
                          onPressed:()=>removeFromCart(product, context) ,
                          icon: Icon(Icons.delete, color: Colors.grey[300],),
                        ),
                      ),
                    );
                  },
              ))
        ],
      ),

    ),);
  }
}
