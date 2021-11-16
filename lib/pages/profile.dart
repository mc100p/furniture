import 'package:flutter/material.dart';
import 'package:furniture/utils/furniture_icons.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container1(size: size),
          Container2(size: size),
          Container3(size: size),
        ],
      ),
    );
  }
}

class Container1 extends StatelessWidget {
  const Container1({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.30,
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, top: 40.0, bottom: 40.0),
              child: Row(
                children: [
                  Text(
                    "Hi, Mikhail Campbell",
                    style:
                        TextStyle(fontFamily: 'KaiseiOpti-Bold', fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "3",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                      Text(
                        "Coupons",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "0",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                      Text(
                        "Points",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Furniture.wallet),
                      Text(
                        "Wallet",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Furniture.gift_card),
                      Text(
                        "Gift Card",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Container2 extends StatelessWidget {
  const Container2({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.25,
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                  child: Text(
                    "My Orders",
                    style: TextStyle(
                      fontFamily: "KaiseiOpti-Bold",
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "3",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                      Text(
                        "Unpaid",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Furniture.processing),
                      Text(
                        "Processing",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Furniture.sent_1),
                      Text(
                        "Shipped",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Furniture.return_icon),
                      Text(
                        "Returns",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Container3 extends StatelessWidget {
  const Container3({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.35,
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "More Services",
                        style: TextStyle(
                          fontFamily: "KaiseiOpti-Bold",
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Furniture.support),
                      Text(
                        "Support",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Furniture.editing),
                      Text(
                        "Suggestions",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Furniture.money),
                      Text(
                        "Share & Earn",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(Furniture.logout),
                      Text(
                        "Sign Out",
                        style: TextStyle(
                            fontFamily: "KaiseiOpti-Regular", fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
