import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_boilerplate/core/theme/scale.dart';
import 'package:mvvm_boilerplate/core/utils/textstyle_extensions.dart';

class AppCss {
  static TextStyle baseStyle = const TextStyle(
    fontFamily: Fonts.inter,
    fontWeight: FontWeight.w400,
    height: 1.25,
  );

  static TextStyle get h1 => baseStyle.medium.size(72).textHeight(1);
  static TextStyle get h2 => baseStyle.medium.size(56).textHeight(1);
  static TextStyle get h3 => baseStyle.medium.size(44).textHeight(1);
  static TextStyle get h4 => baseStyle.medium.size(40).textHeight(1);
  static TextStyle get h5 => baseStyle.medium.size(32).textHeight(1);
  static TextStyle get h6 => baseStyle.medium.size(28).textHeight(1);

  static TextStyle get bodyXXL => baseStyle.size(50).textHeight(1);
  static TextStyle get bodyExtraLarge => baseStyle.size(40).textHeight(1);
  static TextStyle get bodyLarge => baseStyle.size(32).textHeight(1);
  static TextStyle get bodyLargeSemibold => baseStyle.semiBold.size(32).textHeight(1);
  static TextStyle get bodyBase => baseStyle.size(28).textHeight(1);
  static TextStyle get bodyBaseSemibold => baseStyle.semiBold.size(28).textHeight(1);
  static TextStyle get bodySmall => baseStyle.size(24).textHeight(1);
  static TextStyle get bodySmallSemiBold => baseStyle.semiBold.size(24).textHeight(1);

  static TextStyle get caption => baseStyle.size(20).textHeight(1);
  static TextStyle get captionSmall => baseStyle.size(16).textHeight(1);
}
