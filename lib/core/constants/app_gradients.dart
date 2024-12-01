import 'package:flutter/material.dart';

class CustomGradient extends LinearGradient {
  const CustomGradient(
      {super.colors = const [Color(0xffFFDE6E), Color(0xffFBC614)]});

  @override
  AlignmentGeometry get begin => Alignment.topLeft;

  @override
  AlignmentGeometry get end => Alignment.bottomRight;
}