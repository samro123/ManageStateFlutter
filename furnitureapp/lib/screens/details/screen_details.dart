import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnitureapp/constants.dart';
import 'package:furnitureapp/models/product.dart';
import 'package:furnitureapp/screens/carts/cart_screen.dart';
import 'package:furnitureapp/screens/details/component/body.dart';

class ScreenDetails extends StatelessWidget {
  final Product product;
  const ScreenDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: kDefaultPadding),
          icon: SvgPicture.asset('assets/icons/back.svg') , onPressed: (){
            Navigator.pop(context);
        },),
        title: Text(
          'Back',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen(),));
              },
              icon: SvgPicture.asset('assets/icons/cart_with_item.svg')
          )
        ],
      ),
      body: Body(product: product,),
    );
  }
}
