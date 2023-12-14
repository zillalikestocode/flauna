import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles extends TextStyle {
  static TextStyle logoFont = const TextStyle(fontFamily: 'Vina');
  static TextStyle baseFont =  const TextStyle(fontFamily: 'Manrope');

  static TextStyle h1 =
      baseFont.copyWith(fontSize: 32, fontWeight: FontWeight.bold);
  static TextStyle h2 =
      baseFont.copyWith(fontSize: 28, fontWeight: FontWeight.w600);
  static TextStyle h3 =
      baseFont.copyWith(fontSize: 24, fontWeight: FontWeight.w600);
  static TextStyle h4 =
      baseFont.copyWith(fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle norm =
      baseFont.copyWith(fontSize: 16, fontWeight: FontWeight.w400);
}

const Color accentColor = Color(0xFF4B8E4B);
