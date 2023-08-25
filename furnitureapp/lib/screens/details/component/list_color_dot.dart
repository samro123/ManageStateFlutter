import 'package:flutter/material.dart';
import 'package:furnitureapp/screens/details/component/color_dot.dart';

import '../../../constants.dart';

class ListOfColor extends StatelessWidget {
  const ListOfColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorDot(
            fillColor: Colors.grey,
            isSelected: true,
          ),
          ColorDot(
            fillColor: Colors.red,
            isSelected: false,
          ),
          ColorDot(
            fillColor: kPrimaryColor,
            isSelected: false,
          ),
        ],
      ),
    )
    ;
  }
}
