import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff37693d),
      surfaceTint: Color(0xff37693d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb8f0b9),
      onPrimaryContainer: Color(0xff1e5027),
      secondary: Color(0xff326940),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffb5f1bd),
      onSecondaryContainer: Color(0xff18512b),
      tertiary: Color(0xff3d6838),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbef0b2),
      onTertiaryContainer: Color(0xff255022),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xffFDF6E3),
      onSurface: Color(0xff1d1c13),
      onSurfaceVariant: Color(0xff4a4739),
      outline: Color(0xff7b7768),
      outlineVariant: Color(0xffccc6b5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff333027),
      inversePrimary: Color(0xff9dd49e),
      primaryFixed: Color(0xffb8f0b9),
      onPrimaryFixed: Color(0xff002108),
      primaryFixedDim: Color(0xff9dd49e),
      onPrimaryFixedVariant: Color(0xff1e5027),
      secondaryFixed: Color(0xffb5f1bd),
      onSecondaryFixed: Color(0xff00210b),
      secondaryFixedDim: Color(0xff99d4a2),
      onSecondaryFixedVariant: Color(0xff18512b),
      tertiaryFixed: Color(0xffbef0b2),
      onTertiaryFixed: Color(0xff002202),
      tertiaryFixedDim: Color(0xffa2d398),
      onTertiaryFixedVariant: Color(0xff255022),
      surfaceDim: Color(0xffdfdacc),
      surfaceBright: Color(0xffFDF6E3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f3e5),
      surfaceContainer: Color(0xfff3ede0),
      surfaceContainerHigh: Color(0xffeee8da),
      surfaceContainerHighest: Color(0xffe8e2d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff093f18),
      surfaceTint: Color(0xff37693d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff45784b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff013f1b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff41794e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff143f13),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4b7845),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xffFDF6E3),
      onSurface: Color(0xff131109),
      onSurfaceVariant: Color(0xff39362a),
      outline: Color(0xff565244),
      outlineVariant: Color(0xff716d5e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff333027),
      inversePrimary: Color(0xff9dd49e),
      primaryFixed: Color(0xff45784b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2d5f34),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff41794e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff285f38),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4b7845),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff335e2f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcbc6b9),
      surfaceBright: Color(0xffFDF6E3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f3e5),
      surfaceContainer: Color(0xffeee8da),
      surfaceContainerHigh: Color(0xffe2dccf),
      surfaceContainerHighest: Color(0xffd7d1c4),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003410),
      surfaceTint: Color(0xff37693d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff21532a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003415),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff1b532d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff07340a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff285225),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xffFDF6E3),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2f2c20),
      outlineVariant: Color(0xff4d493c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff333027),
      inversePrimary: Color(0xff9dd49e),
      primaryFixed: Color(0xff21532a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff043b15),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff1b532d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003c19),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff285225),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff103b10),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbdb8ac),
      surfaceBright: Color(0xffFDF6E3),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f0e2),
      surfaceContainer: Color(0xffe8e2d4),
      surfaceContainerHigh: Color(0xffdad4c7),
      surfaceContainerHighest: Color(0xffcbc6b9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9dd49e),
      surfaceTint: Color(0xff9dd49e),
      onPrimary: Color(0xff023913),
      primaryContainer: Color(0xff1e5027),
      onPrimaryContainer: Color(0xffb8f0b9),
      secondary: Color(0xff99d4a2),
      onSecondary: Color(0xff003918),
      secondaryContainer: Color(0xff18512b),
      onSecondaryContainer: Color(0xffb5f1bd),
      tertiary: Color(0xffa2d398),
      onTertiary: Color(0xff0d380e),
      tertiaryContainer: Color(0xff255022),
      onTertiaryContainer: Color(0xffbef0b2),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff15130c),
      onSurface: Color(0xffe8e2d4),
      onSurfaceVariant: Color(0xffccc6b5),
      outline: Color(0xff969180),
      outlineVariant: Color(0xff4a4739),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e2d4),
      inversePrimary: Color(0xff37693d),
      primaryFixed: Color(0xffb8f0b9),
      onPrimaryFixed: Color(0xff002108),
      primaryFixedDim: Color(0xff9dd49e),
      onPrimaryFixedVariant: Color(0xff1e5027),
      secondaryFixed: Color(0xffb5f1bd),
      onSecondaryFixed: Color(0xff00210b),
      secondaryFixedDim: Color(0xff99d4a2),
      onSecondaryFixedVariant: Color(0xff18512b),
      tertiaryFixed: Color(0xffbef0b2),
      onTertiaryFixed: Color(0xff002202),
      tertiaryFixedDim: Color(0xffa2d398),
      onTertiaryFixedVariant: Color(0xff255022),
      surfaceDim: Color(0xff15130c),
      surfaceBright: Color(0xff3c3930),
      surfaceContainerLowest: Color(0xff100e07),
      surfaceContainerLow: Color(0xff1d1c13),
      surfaceContainer: Color(0xff222017),
      surfaceContainerHigh: Color(0xff2c2a21),
      surfaceContainerHighest: Color(0xff37352b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb2eab3),
      surfaceTint: Color(0xff9dd49e),
      onPrimary: Color(0xff002d0d),
      primaryContainer: Color(0xff699d6c),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffafebb7),
      onSecondary: Color(0xff002d11),
      secondaryContainer: Color(0xff659d6f),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb8e9ad),
      onTertiary: Color(0xff012d04),
      tertiaryContainer: Color(0xff6e9c66),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff15130c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe2dcca),
      outline: Color(0xffb7b2a1),
      outlineVariant: Color(0xff959080),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e2d4),
      inversePrimary: Color(0xff1f5228),
      primaryFixed: Color(0xffb8f0b9),
      onPrimaryFixed: Color(0xff001504),
      primaryFixedDim: Color(0xff9dd49e),
      onPrimaryFixedVariant: Color(0xff093f18),
      secondaryFixed: Color(0xffb5f1bd),
      onSecondaryFixed: Color(0xff001506),
      secondaryFixedDim: Color(0xff99d4a2),
      onSecondaryFixedVariant: Color(0xff013f1b),
      tertiaryFixed: Color(0xffbef0b2),
      onTertiaryFixed: Color(0xff001601),
      tertiaryFixedDim: Color(0xffa2d398),
      onTertiaryFixedVariant: Color(0xff143f13),
      surfaceDim: Color(0xff15130c),
      surfaceBright: Color(0xff47443b),
      surfaceContainerLowest: Color(0xff090703),
      surfaceContainerLow: Color(0xff201e15),
      surfaceContainer: Color(0xff2a281f),
      surfaceContainerHigh: Color(0xff353329),
      surfaceContainerHighest: Color(0xff403e34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc5fec5),
      surfaceTint: Color(0xff9dd49e),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff99d09a),
      onPrimaryContainer: Color(0xff000f02),
      secondary: Color(0xffc2ffca),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff96d09e),
      onSecondaryContainer: Color(0xff000f03),
      tertiary: Color(0xffcbfdbf),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff9fcf95),
      onTertiaryContainer: Color(0xff000f01),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff15130c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff6f0dd),
      outlineVariant: Color(0xffc8c2b1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe8e2d4),
      inversePrimary: Color(0xff1f5228),
      primaryFixed: Color(0xffb8f0b9),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff9dd49e),
      onPrimaryFixedVariant: Color(0xff001504),
      secondaryFixed: Color(0xffb5f1bd),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff99d4a2),
      onSecondaryFixedVariant: Color(0xff001506),
      tertiaryFixed: Color(0xffbef0b2),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa2d398),
      onTertiaryFixedVariant: Color(0xff001601),
      surfaceDim: Color(0xff15130c),
      surfaceBright: Color(0xff535046),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff222017),
      surfaceContainer: Color(0xff333027),
      surfaceContainerHigh: Color(0xff3e3b32),
      surfaceContainerHighest: Color(0xff4a473d),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
