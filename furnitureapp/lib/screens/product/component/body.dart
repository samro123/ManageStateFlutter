import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnitureapp/components/categorylist.dart';
import 'package:furnitureapp/components/productcard.dart';
import 'package:furnitureapp/components/search_box.dart';
import 'package:furnitureapp/constants.dart';
import 'package:furnitureapp/models/product.dart';
import 'package:furnitureapp/models/shop.dart';
import 'package:furnitureapp/screens/details/screen_details.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void navigateToFood(int index){
    final shop = context.read<Shop>();
    final furniture = shop.productMenu;
    Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => ScreenDetails(product: furniture[index]),)
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final furniture = shop.productMenu;

    return Column(
      children: [
        SearchBox(
          onChanged: (value) {

          },
        ),
        CategoryList(),
        SizedBox(height: kDefaultPadding/2,),
        Expanded(child: Stack(
          children: [
            //background
            Container(
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                )
              ),
              margin: EdgeInsets.only(top: 70),
            ),
            ListView.builder(
              itemCount: furniture.length,
              itemBuilder: (context, index) {
              return ProductCard(
                itemIndex: index,
                product: products[index],
                press:()=> navigateToFood(index),
              );

            },)
          ],
        ))
      ],
    );
  }
}
