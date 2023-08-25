import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnitureapp/constants.dart';
import 'package:furnitureapp/models/product.dart';
import 'package:furnitureapp/models/shop.dart';
import 'package:furnitureapp/screens/details/component/chat_addtocart.dart';
import 'package:furnitureapp/screens/details/component/color_dot.dart';
import 'package:furnitureapp/screens/details/component/list_color_dot.dart';
import 'package:furnitureapp/screens/details/component/product_poster.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final Product product;
  const Body({Key? key ,required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    int quantityCount = 1;

    void addToCart(){
      if(quantityCount > 0){
        //get access to shop
        final shop = context.read<Shop>();

        //add to cart
        shop.addToCart(widget.product, quantityCount);

        //let the user know it was successful
        showDialog(
            context: context,
            builder:(context) => AlertDialog(
              backgroundColor: kPrimaryColor,
              content:const Text('Successfully added to cart',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                   textAlign: TextAlign.center,
              ),
              actions: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                    icon: Icon(Icons.done,color: Colors.white,))
              ],
            ) ,
        );
      }
    }


    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //lam cho cho
            width: double.infinity,
            height: size.width * 1.2,
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              )
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Hero(
                      tag:'${widget.product.id}' ,
                      child: ProductPoster(
                          size: size,
                          img: widget.product.image,
                      ),
                    ),
                  ),
                  ListOfColor(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPadding/2),
                    child: Text("Poppy Plasic Tub Chair",
                    style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text('\$${widget.product.price}', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kSecondaryColor
                  ),),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPadding /2),
                    child: Text(widget.product.description, style: TextStyle(color: kTextLightColor),),
                  ),
                  SizedBox(height: kDefaultPadding,)
                ],
              ),
            ),
          ),
          ChatAndAddToCart(onTap: addToCart,),
        ],
      ),
    );
  }
}
