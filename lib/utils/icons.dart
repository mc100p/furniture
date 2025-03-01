import 'package:flutter/material.dart';
import 'package:furniture/utils/furniture_icons.dart';
import 'package:furniture/utils/magic_string.dart';

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

final star = IconWidget(
    icon: Furniture.star,
    name: IconWidgetsName.All.name,
    tag: IconWidgetsTag.All.name);

final chair = IconWidget(
    icon: Furniture.chair,
    name: IconWidgetsName.Chair.name,
    tag: IconWidgetsTag.Chair.name);

final table = IconWidget(
    icon: Furniture.table,
    name: IconWidgetsName.Table.name,
    tag: IconWidgetsTag.Table.name);

final armChair = IconWidget(
    icon: Furniture.sofa,
    name: IconWidgetsName.Armchair.name,
    tag: IconWidgetsTag.ArmChair.name);

final bed = IconWidget(
    icon: Furniture.bed,
    name: IconWidgetsName.Bed.name,
    tag: IconWidgetsTag.Bed.name);

final lampStand = IconWidget(
  icon: Furniture.night_stand,
  name: IconWidgetsName.Lampstand.name,
  tag: IconWidgetsTag.Lamp.name,
);

List iconItems = [star, chair, table, armChair, bed, lampStand];
