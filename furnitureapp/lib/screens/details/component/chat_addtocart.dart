import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnitureapp/constants.dart';

class ChatAndAddToCart extends StatelessWidget {
  final void Function()? onTap;
  const ChatAndAddToCart ({Key? key, required this.onTap }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/chat.svg', height: 18,),
          SizedBox(width: kDefaultPadding / 2,),
          Text('Chat', style: TextStyle(color: Colors.white),),
          // it will cover all available spaces
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/shopping-bag.svg', height: 18,),
                Text("Add to Cart", style: TextStyle(color: Colors.white),)
              ],
            ),
          )
        ],
      ),
    )
    ;
  }
}
