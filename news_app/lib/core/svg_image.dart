// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture customSvg({String? name, Color? color, height, width}) {
  return SvgPicture.asset(
    'assets/images/$name.svg',
    height: height,
    width: width,
    color: color,
  );
}
