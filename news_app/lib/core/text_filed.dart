// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../core/color.dart';
import '../core/constant.dart';

Column customTextFeild(
    {controller,
    title,
    hint,
    icon,
    suffixIconColor,
    lines = 1,
    isTitileAviable = true,
    keyboardType,
    maxLength,
    inputFormatters,
    readOnly = false,
    color = kLightBlueColor,
    String? Function(String?)? validator,
    obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      heght8,
      isTitileAviable
          ? Text(
              title,
              style: TextStyle(
                color: lightGreyColor,
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
              ),
            )
          : SizedBox(),
      heght10,
      TextFormField(
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        maxLength: maxLength,
        controller: controller,
        cursorColor: kBlackColor,
        readOnly: readOnly,
        validator: validator,
        maxLines: lines,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(16.0)),
          filled: true,
          fillColor: color,
          isDense: true,
          hintText: hint,
        ),
      ),
    ],
  );
}
