import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnitureapp/constants.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged onChanged;
  const SearchBox({Key? key , required this.onChanged} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(kDefaultPadding),
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding/4
          ),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20)
          ),
          child: TextField(
            onChanged: onChanged,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                icon: SvgPicture.asset('assets/icons/search.svg'),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white)
            ),
          ),
        )
      ],
    );
  }
}
