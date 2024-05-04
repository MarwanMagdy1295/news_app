// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../core/color.dart';

customButton({
  String? title,
  void Function()? onTap,
  height,
  width,
  Color bottomColor = kLightBlueColor,
  Color TextColor = kDeepBlueColor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: bottomColor, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Text(
          title!,
          style: TextStyle(
            color: TextColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
