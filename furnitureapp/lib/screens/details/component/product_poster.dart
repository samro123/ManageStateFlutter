import 'package:flutter/material.dart';
import 'package:furnitureapp/constants.dart';

class ProductPoster extends StatelessWidget {
  final Size size;
  final String img;
  const ProductPoster({Key? key, required this.size, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // imga
      Container(
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
        //height of this container is 80% of our width
        height: size.width * 0.8,
        //color: Colors.black,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: size.width * 0.7,
              width: size.width * 0.7,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
            ),
            Image.asset(
              img,
              height: size.width * 0.75,
              width: size.width * 0.75,
              fit: BoxFit.cover,
            )
          ],
        ),
      );
  }
}
