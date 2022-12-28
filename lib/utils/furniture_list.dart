class Products {
  late String imgUrl;
  late String name;
  late String tag;
  late double price;
  late String description;
  late int reviews;
  late double ratings;

  Products({
    required this.imgUrl,
    required this.name,
    required this.tag,
    required this.price,
    required this.description,
    required this.reviews,
    required this.ratings,
  });

  Products.fromJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    name = json['name'];
    tag = json['tag'];
    price = json['price'];
    description = json['description'];
    reviews = json['reviews'];
    ratings = json['ratings'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imgUrl'] = imgUrl;
    data['name'] = name;
    data['tag'] = tag;
    data['price'] = price;
    data['description'] = description;
    data['reviews'] = reviews;
    data['ratings'] = ratings;
    return data;
  }
}

//Lamps
final lamp_1 = Products(
  imgUrl: "images/lamp_1.jpg",
  name: "Black Simple Lamp",
  tag: "Lamp",
  price: 12.00,
  description: "Simple and elegant, a pair of cute little table lamps can"
      " definitely be integrated into any home decoration, practical, and add a"
      " sense of design to your room.",
  ratings: 2.5,
  reviews: 62,
);

//Chairs
final chair_1 = Products(
    imgUrl: "images/chair_1.jpg",
    name: "Coffee Chair",
    tag: "Chair",
    description: "Bohemiana is rhapsody for your home. Heres to the misfits and"
        " the rebels, the rule-breakers, the square pegs in the round holes, the"
        " ones who see things differently. Bohemiana is a collection thats just"
        " as unique as you. Channel your inner bohemian self with a furniture"
        " line thats part industrial, part distressed and 100% avant garde.",
    ratings: 5.0,
    reviews: 41,
    price: 20.00);

final chair_2 = Products(
    imgUrl: "images/chair_2.jpg",
    name: "Brown Chair",
    tag: "Chair",
    description: "Bohemiana is rhapsody for your home. Heres to the misfits and"
        " the rebels, the rule-breakers, the square pegs in the round holes, the"
        " ones who see things differently. Bohemiana is a collection thats just"
        " as unique as you. Channel your inner bohemian self with a furniture"
        " line thats part industrial, part distressed and 100% avant garde.",
    ratings: 3.2,
    reviews: 10,
    price: 27.00);

//Beds

final bed_1 = Products(
    imgUrl: "images/bed_1.jpg",
    name: "Giselle Antique",
    tag: "Bed",
    description: "This charming old-school antique iron bed offers a classic"
        " style that looks fabulous in a rustic or traditional home. The antique"
        " bronze finish gives this bed frame a truly vintage look that appears"
        " beautifully authentic. The bed's combination of straight and curved"
        " lines provides flowing elegance that complements nearly any style of"
        " bedroom decor.",
    ratings: 3.0,
    reviews: 12,
    price: 95.00);

final bed_2 = Products(
    imgUrl: "images/bed_2.jpg",
    name: "Montauk Panel Bed",
    tag: "Bed",
    description: "Bring country charm to your bedroom decor with this stylish"
        " Montauk panel bed. Crafted from solid pine wood, the king-size bed"
        " features a slat-style headboard and footboard, available in a variety"
        " of warm, rustic finishes that show off the natural beauty of the"
        " woodgrain.",
    ratings: 2.0,
    reviews: 12,
    price: 82.00);

final bed_3 = Products(
    imgUrl: "images/bed_3.jpg",
    name: "French Classic",
    tag: "Bed",
    description: "Update the look of your bedroom with this Ayrshire Downs"
        " platform bed from The Gray Barn. Designed to be used without a box"
        " spring, the elegant bed is made from solid rubberwood, plywood,"
        " and miff slats, and includes a headboard, upholstered base, and"
        " matching footboard. ",
    ratings: 2.0,
    reviews: 12,
    price: 82.00);

final bed_4 = Products(
    imgUrl: "images/bed_4.jpg",
    name: "Wol Classic",
    tag: "Bed",
    description: "Update the look of your bedroom with this Ayrshire Downs"
        " platform bed from The Gray Barn. Designed to be used without a box"
        " spring, the elegant bed is made from solid rubberwood, plywood,"
        " and miff slats, and includes a headboard, upholstered base, and"
        " matching footboard. ",
    ratings: 3.0,
    reviews: 50,
    price: 100.00);

//ArmChairs
final armChair_1 = Products(
    imgUrl: "images/armChair_1.jpg",
    name: "Leather Mid Century",
    tag: "ArmChair",
    description: "Add this contemporary-designed chair to your office, living"
        " room or  bedroom to breathe new life into a boring space, or create"
        " an intimate  conversation nook by pairing two chairs together. ",
    ratings: 2.0,
    reviews: 12,
    price: 25.00);

final armChair_2 = Products(
    imgUrl: "images/armChair_2.jpg",
    name: "Ariana Parson",
    tag: "ArmChair",
    description: "Update the look of your bedroom with this Ayrshire Downs"
        " platform bed from The Gray Barn. Designed to be used without a box"
        " spring, the elegant bed is made from solid rubberwood, plywood,"
        " and miff slats, and includes a headboard, upholstered base, and"
        " matching footboard. ",
    ratings: 2.0,
    reviews: 12,
    price: 22.00);

final armChair_3 = Products(
    imgUrl: "images/armChair_3.jpg",
    name: "WYNDENHALL",
    tag: "ArmChair",
    description:
        "This accent chair features pocket coils, high density foam and"
        " webbing surrounded by thick batting for luxurious comfort and durability."
        " The perfect"
        " addition to your home for its style and comfort.",
    ratings: 2.0,
    reviews: 12,
    price: 30.00);

//Tables
final table_1 = Products(
    imgUrl: "images/table_1.jpg",
    name: "Minimal Stand",
    tag: "Table",
    description: "Minimal Stand is made of by natural wood. The design that is"
        " very simple and minimal. This is truly one of the best furnitures in any "
        "family for now. With 3 different colors, you can easily select the best "
        " match for you home.",
    ratings: 4.5,
    reviews: 50,
    price: 25.00);

final table_2 = Products(
    imgUrl: "images/table_2.jpg",
    name: "Simple Desk",
    tag: "Table",
    description: "This desk is a great choice for home office activities,"
        " including writing. This simple frame design is easy to move and save"
        " space. This desk is the best choice for a small apartment, which doesn't"
        " take up space. This desk can be put in a study, bedroom, living room,"
        " kitchen, children's room, office at will.",
    ratings: 2.5,
    reviews: 16,
    price: 50.00);

List<Products> products = [
  lamp_1,
  table_1,
  table_2,
  chair_1,
  chair_2,
  bed_1,
  bed_2,
  bed_3,
  bed_4,
  armChair_1,
  armChair_2,
  armChair_3,
];
