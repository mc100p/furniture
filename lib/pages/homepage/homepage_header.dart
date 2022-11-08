import 'package:flutter/material.dart';
import 'package:furniture/utils/furniture_icons.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: () {}, child: Icon(Furniture.magnifying_glass)),
          Column(
            children: [
              Text(
                "Make Home",
                style:
                    TextStyle(fontFamily: 'KaiseiOpti-Regular', fontSize: 14),
              ),
              Text(
                "BEAUTIFUL",
                style: TextStyle(fontFamily: 'KaiseiOpti-Bold', fontSize: 16),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: Icon(Furniture.shopping_cart__1_),
          ),
        ],
      ),
    );
  }
}
