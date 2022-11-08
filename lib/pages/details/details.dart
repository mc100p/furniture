import 'package:flutter/material.dart';
import 'package:furniture/pages/details/details_components.dart';

class Details extends StatefulWidget {
  final itemList;

  Details({required this.itemList});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int num = 01;
  IconData? _selectedIcon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void increaseNum() {
      setState(() {
        if (num < 10) {
          num++;
        }
      });
    }

    void decreaseNum() {
      setState(() {
        if (num > 1) {
          num--;
        }
      });
    }

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () => photoPopUp(
                          context, widget.itemList.imgUrl, constraints, size),
                      child: image(size, widget.itemList.imgUrl, constraints),
                    ),
                    backArrow(context, size, constraints)
                  ],
                ),
                detailBody(constraints, increaseNum, size, decreaseNum, context,
                    widget.itemList, _selectedIcon ?? Icons.star, num),
              ],
            ),
          ),
        );
      }),
    );
  }
}
