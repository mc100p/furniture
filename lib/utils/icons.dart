import 'package:flutter/material.dart';
import 'package:furniture/utils/furniture_icons.dart';

class IconWidget {
  IconData icon;
  String name;
  String tag;

  IconWidget({
    required this.icon,
    required this.name,
    required this.tag,
  });
}

final star = IconWidget(icon: Furniture.star, name: "All", tag: "All");

final chair = IconWidget(icon: Furniture.chair, name: "Chair", tag: "Chair");

final table = IconWidget(icon: Furniture.table, name: "Table", tag: "Table");

final armChair =
    IconWidget(icon: Furniture.sofa, name: "Armchair", tag: "ArmChair");

final bed = IconWidget(icon: Furniture.bed, name: "Bed", tag: "Bed");

final lampStand = IconWidget(
  icon: Furniture.night_stand,
  name: "Lampstand",
  tag: "Lamp",
);

List iconItems = [star, chair, table, armChair, bed, lampStand];
