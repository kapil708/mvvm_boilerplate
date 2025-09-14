import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_boilerplate/core/utils/textstyle_extensions.dart';

class AppCss {
  static TextStyle bodyFont = const TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0, fontFamily: "Roboto");
  static TextStyle headlineFont = const TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0, fontFamily: "Poppins");

  static TextStyle get h1 => headlineFont.medium.size(72).textHeight(1);
  static TextStyle get h2 => headlineFont.medium.size(56).textHeight(1);
  static TextStyle get h3 => headlineFont.medium.size(44).textHeight(1);
  static TextStyle get h4 => headlineFont.medium.size(40).textHeight(1);
  static TextStyle get h5 => headlineFont.medium.size(32).textHeight(1);
  static TextStyle get h6 => headlineFont.medium.size(28).textHeight(1);

  static TextStyle get bodyXXL => bodyFont.size(50).textHeight(1);
  static TextStyle get bodyExtraLarge => bodyFont.size(40).textHeight(1);
  static TextStyle get bodyLarge => bodyFont.size(32).textHeight(1);
  static TextStyle get bodyLargeSemibold => bodyFont.semiBold.size(32).textHeight(1);
  static TextStyle get bodyBase => bodyFont.size(28).textHeight(1);
  static TextStyle get bodyBaseSemibold => bodyFont.semiBold.size(28).textHeight(1);
  static TextStyle get bodySmall => bodyFont.size(24).textHeight(1);
  static TextStyle get bodySmallSemiBold => bodyFont.semiBold.size(24).textHeight(1);

  static TextStyle get caption => bodyFont.size(20).textHeight(1);
  static TextStyle get captionSmall => bodyFont.size(16).textHeight(1);
}
