import 'dart:math';

import 'package:flutter/material.dart';

var icons = [
  Icons.favorite_border,
  Icons.add,
  Icons.ac_unit,
  Icons.add_alarm_sharp,
  Icons.account_box_sharp,
  Icons.accessibility_outlined,
  Icons.face,
  Icons.upcoming_sharp,
  Icons.link_off,
  Icons.query_builder,
  Icons.mic,
  Icons.superscript,
  Icons.flourescent,
  Icons.flag,
  Icons.microwave,
  Icons.ad_units_outlined,
  Icons.smart_button_outlined,
  Icons.menu_book,
  Icons.edit,
  Icons.pages_rounded,
  Icons.volume_mute_outlined
];

IconData getRandomIcon() {
  return icons[Random().nextInt(icons.length - 1)];
}
