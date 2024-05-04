import 'package:flutter/material.dart';
import 'package:news_app/core/color.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: kBlackColor,
      ),
    );
  }
}
