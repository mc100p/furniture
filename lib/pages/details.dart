import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniture/utils/furniture_icons.dart';

class Details extends StatefulWidget {
  final id;
  final imgUrl;
  final name;
  final tag;
  final price;
  final description;
  final reviews;
  late final ratings;

  Details({
    this.id,
    this.imgUrl,
    this.name,
    this.tag,
    this.price,
    this.description,
    this.ratings,
    this.reviews,
  });

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var num = 01;
  IconData? _selectedIcon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: size.height * 0.50,
                      width: size.width * 0.75,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                        ),
                        child: Hero(
                          tag: widget.imgUrl,
                          child: Image.asset(
                            widget.imgUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 190.0, top: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: SizedBox(
                          height: size.height * 0.07,
                          width: size.width * 0.13,
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
                            child: Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontFamily: 'KaiseiOpti-Medium', fontSize: 25.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '\$' + widget.price.toString(),
                              style: TextStyle(
                                  fontFamily: 'KaiseiOpti-Medium',
                                  fontSize: 22.0),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (num < 10) {
                                    num++;
                                  }
                                });
                              },
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
                                  fontSize: 16.0,
                                  fontFamily: 'KaiseiOpti-Medium'),
                            ),
                            SizedBox(width: 10.0),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (num > 1) {
                                    num--;
                                  }
                                });
                              },
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
                            rating: widget.ratings,
                            itemBuilder: (context, index) => Icon(
                              _selectedIcon ?? Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 15.0,
                            unratedColor: Colors.amber.withAlpha(50),
                            direction: Axis.horizontal,
                          ),
                          SizedBox(width: 10),
                          Text(
                            widget.ratings.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "(" + widget.reviews.toString() + "\treviews)",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Wrap(
                        children: [
                          Text(widget.description),
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
                              child: Text("Add to cart"),
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
