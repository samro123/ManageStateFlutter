import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/models/shops.dart';
import 'package:sushi/theme/colors.dart';

class Details extends StatefulWidget {
  final Food food;
  const Details({Key? key , required this.food}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  //quantity
  int quantityCount = 0 ;

  //decrement quantity
  void decrementQuantity(){
    setState(() {
      if(quantityCount > 0){
        quantityCount--;
      }
    });
  }

  void incrementQuantity(){
    setState(() {
      quantityCount++;
    });
  }

  //add to cart

  void addToCart(){

    //only add to cart if there is something in the cart
    if(quantityCount>0){
      //get access to shop
      final shop = context.read<Shop>();

      //add to cart
      shop.addToCart(widget.food, quantityCount);

      //let the user know it was successful
      showDialog(
          context: context,
          barrierDismissible: false,

          builder: (context) => AlertDialog(
            backgroundColor: primaryColor,
            content:const Text("Successfuly added to cart",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                              ),
            actions: [
              IconButton(onPressed: () {

                // //pop once to remove dialog box
                // Navigator.pop(context);
                //
                // //pop again to go previous screen
                //
                // Navigator.pop(context);

                Navigator.pushNamedAndRemoveUntil(context, '/menupage', (route) => false);

              },
                  icon: Icon(Icons.done, color: Colors.white,))
            ],
      ),);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView(
                  children: [
                    Image.asset(widget.food.img, height: 200,),

                    const SizedBox(height: 25,),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow[800],),
                        const SizedBox(width: 5,),
                        Text(widget.food.rating,
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold
                          ),)
                      ],
                    ),

                    const SizedBox(height: 10,),
                    Text(
                      widget.food.name,
                      style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                    ),
                    const SizedBox(height: 20,),
                    Text("Description",
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),),
                    const SizedBox(height: 10,),
                    Text('A staple rice dish of Japanese cuisine, consisting of cooked rice flavoured with vinegar and a variety of vegetable, egg, or raw seafood garnishes and served cold. Restaurants specializing in sushi abound in Japan, where subtleties of preparation find a discriminating clientele, and the dish has gained popularity in the United States and elsewhere (see also sashimi).',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            height: 2
                          ),
                    )

                  ],
                ),
              )
          ),
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$" + widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                    //quantity
                    Row(
                      children: [

                      Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                           shape: BoxShape.circle
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.remove, color: Colors.white,),
                          onPressed: decrementQuantity,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(quantityCount.toString(),
                               style: TextStyle(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 18
                               ),
                          ),
                        ),
                      ),
                      
                      Container(
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white,),
                          onPressed: incrementQuantity,
                        ),
                      )
                    ],)
                  ],
                ),
                //add

                const SizedBox(height: 10,),

                MyButton(text: "Add To Cart", onTap: addToCart),
              ],
            ),
          ),
            ],
      ),
    );
  }
}
