import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/components/food_tile.dart';
import 'package:sushi/components/my_tile.dart';
import 'package:sushi/models/shops.dart';
import 'package:sushi/page/detials_page.dart';
import 'package:sushi/theme/colors.dart';

class MenuPage extends StatefulWidget {
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigate to food  item details page
  void navigateToFood(int index) {
    final shop = context.read<Shop>();
    final foods = shop.foodMenu;
    Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => Details(food: foods[index]),));
  }

  @override
  Widget build(BuildContext context) {

    final shop = context.read<Shop>();
    final foods = shop.foodMenu;
    final carts = shop.cart;


    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Text('Tokyo'),
        ),
        actions: [
          carts.isEmpty
              ? IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: Icon(Icons.shopping_cart,))
              : IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: Icon(Icons.shopping_cart, color: Colors.blue,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // promo banner
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                decoration: BoxDecoration(
                  color:primaryColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                      Text('Get 32% Promo', style: GoogleFonts.dmSerifDisplay(fontSize: 20, color: Colors.white),),
                     const SizedBox(height: 20,),
                      MyButton(text: "Redem", onTap: () {
                      },)
                    ],
                  ),

                  Image.asset('assets/images/sushi1.png', height: 100,)
                ],),
              ),

              const SizedBox(height: 20,),
              //search bar
              MyTextField(),

              const SizedBox(height: 20,),
              //menu list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text('Food Menu', style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
              ),

              const SizedBox(height: 10,),
              //popular food
              Expanded(child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foods.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foods[index],
                  onTap: () => navigateToFood(index),
                ),)),

              SizedBox(height: 20,),

              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20)
                ),
                margin:const EdgeInsets.only(left: 25, bottom: 25,right: 25),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/nigiri.png',height: 60,),
                        const SizedBox(width: 25,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Salmon Eggs', style: GoogleFonts.dmSerifDisplay(fontSize: 18),),
                            const SizedBox(height: 10,),
                            Text('\$ 20.00', style: TextStyle(color: Colors.grey),)
                          ],
                        ),

                      ],
                    ),
                    Icon(Icons.favorite_outline, color: Colors.grey[700],)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
