import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture/utils/furniture_icons.dart';
import 'package:furniture/utils/furniture_list.dart';
import 'package:furniture/utils/magic_string.dart';

Future<dynamic> photoPopUp(
    BuildContext context, Products tag, BoxConstraints constraints, Size size) {
  return showDialog(
    context: context,
    builder: (builder) {
      return AlertDialog(
        content: Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Hero(
                    tag: tag.imgUrl,
                    child: InteractiveViewer(
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Image.asset(
                          tag.imgUrl,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(40),
                ),
                alignment: Alignment.center,
                child: Center(
                  child: IconButton(
                      iconSize: constraints.maxWidth > PageConstaints.tablet
                          ? 20
                          : 17,
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close)),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Align image(Size size, Products tag, BoxConstraints constraints) {
  return Align(
    alignment: Alignment.topRight,
    child: SizedBox(
      height:
          constraints.maxWidth > 768 ? size.height * 0.60 : size.height * 0.50,
      width: constraints.maxWidth > 768 ? size.width * 0.60 : size.width * 0.75,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        ),
        child: Hero(
          tag: tag.imgUrl,
          child: Image.asset(
            tag.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

Padding backArrow(BuildContext context, Size size, BoxConstraints constraints) {
  return Padding(
    padding: const EdgeInsets.only(right: 190.0, top: 20),
    child: Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: SizedBox(
          height: constraints.maxWidth > 768
              ? size.height * 0.09
              : size.height * 0.07,
          width: constraints.maxWidth > 768
              ? size.width * 0.10
              : size.width * 0.13,
          child: Card(
            elevation: 17.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: constraints.maxWidth > 768 ? 30 : 20,
            ),
          ),
        ),
      ),
    ),
  );
}

Padding detailBody(
    BoxConstraints constraints,
    void increaseNum(),
    Size size,
    void decreaseNum(),
    BuildContext context,
    itemList,
    IconData _selectedIcon,
    int num) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              itemList.name,
              style: TextStyle(
                  fontFamily: 'KaiseiOpti-Medium',
                  fontSize: constraints.maxWidth > PageConstaints.tablet
                      ? 35.0
                      : 25.0),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '\$' + itemList.price.toString(),
                  style: TextStyle(
                      fontFamily: 'KaiseiOpti-Medium',
                      fontSize: constraints.maxWidth > PageConstaints.tablet
                          ? 28.0
                          : 22.0),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => increaseNum(),
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.10,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  num.toString(),
                  style: TextStyle(
                      fontSize: constraints.maxWidth > PageConstaints.tablet
                          ? 20.0
                          : 14.0,
                      fontFamily: 'KaiseiOpti-Medium'),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  onTap: () => decreaseNum(),
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.10,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Icon(
                      Icons.remove,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RatingBarIndicator(
                rating: itemList.ratings,
                itemBuilder: (context, index) => Icon(
                  _selectedIcon,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize:
                    constraints.maxWidth > PageConstaints.tablet ? 22.0 : 15.0,
                unratedColor: Colors.amber.withAlpha(50),
                direction: Axis.horizontal,
              ),
              SizedBox(width: 10),
              Text(
                itemList.ratings.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: constraints.maxWidth > PageConstaints.tablet
                        ? 18.0
                        : 14.0),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              "(" + itemList.reviews.toString() + "\treviews)",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: constraints.maxWidth > PageConstaints.tablet
                      ? 18.0
                      : 14.0),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Wrap(
            children: [
              Text(
                itemList.description,
                style: TextStyle(
                    fontSize: constraints.maxWidth > PageConstaints.tablet
                        ? 18.0
                        : 14.0),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  height: size.height * 0.10,
                  width: size.width * 0.15,
                  child: Icon(Furniture.bookmark),
                ),
              ),
              Container(
                height: size.height * 0.10,
                width: size.width * 0.70,
                child: ElevatedButton(
                  child: Text("Add to cart",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
