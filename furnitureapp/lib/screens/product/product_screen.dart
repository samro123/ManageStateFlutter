import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnitureapp/constants.dart';
import 'package:furnitureapp/screens/product/component/body.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text('Dashboard'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: (){},
              icon: SvgPicture.asset('assets/icons/notification.svg'))
        ],
      ),
      body: Body(),
    );
  }
}
