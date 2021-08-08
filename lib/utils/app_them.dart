import 'package:flutter/material.dart';
import 'package:TTF/utils/screen_util.dart';
class TTFAppTheme {
  TTFAppTheme._();
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);

  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'Nunito';
  static const Color blueGrey = Color(0xfff0f0f8);
  static const Color lightGrey = Color(0xffCDD1D5);
  static const Color lighterGrey = Color(0xffF1F3F8);
  static const Color grey2 = Color(0xff7D85A3);
  static const Color darkGrey = Color(0xff656B7D);
  static const Color mediumGrey = Color(0xffA2A7BC);
  static const Color greyShadow = Color(0x172E631C);

  static const Color black = Color(0xff4D4E51);
  static const Color darkBlack = Color(0xff1A1D23);
  static const Color lightBlack = Color(0xff818181);

  static const Color blue = Color(0xff3362CC);
  static const Color lightBlue = Color(0xff3D72DE);
  static const Color lighterBlue = Color(0xffEAEFFA);

  static const Color yellow = Color(0xffFBD46D);
  static const Color darkYellow = Color(0xffFFC758);

  static const Color blackShadow = Color(0x0500000D);

  static const Color brown = Color(0xff965519);
  static const Color lightBrown = Color(0xffFDECDC);

  static const Color green = Color(0xff248484);
  static const Color tealGreen = Color(0xff27B893);
  static const Color lightGreen = Color(0xffD8F9F5);

  static const Color red = Color(0xffFF3131);
  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static const double _fontSize10 = 10.0;
  static const double _fontSize12 = 12.0;
  static const double _fontSize14 = 14.0;
  static const double _fontSize15 = 15.0;
  static const double _fontSize16 = 16.0;
  static const double _fontSize18 = 18.0;
  static const double _fontSize20 = 20.0;
  static const double _fontSize22 = 22.0;
  static const double _fontSize24 = 24.0;
   static const double _fontSize25 = 25.0;
  static const double _fontSize26 = 26.0;
  static const double _fontSize28 = 28.0;
  static const double _fontSize30 = 30.0;
  static const double _fontSize32 = 32.0;
  static const double _fontSize34 = 34.0;
  static const double _fontSize36 = 36.0;

  static double get fontSize10 => ScreenUtil().setSp(_fontSize10);
  static double get fontSize12 => ScreenUtil().setSp(_fontSize12);
  static double fontSize14 = 14;
  static double get fontSize15 => ScreenUtil().setSp(_fontSize15);
  static double get fontSize16 => ScreenUtil().setSp(_fontSize16);
  static double get fontSize18 => ScreenUtil().setSp(_fontSize18);
  static double get fontSize20 => ScreenUtil().setSp(_fontSize20);
  static double get fontSize22 => ScreenUtil().setSp(_fontSize22);
  static double get fontSize24 => ScreenUtil().setSp(_fontSize24);
  static double get fontSize25 => ScreenUtil().setSp(_fontSize25);
  static double get fontSize26 => ScreenUtil().setSp(_fontSize26);
  static double get fontSize28 => ScreenUtil().setSp(_fontSize28);
  static double get fontSize30 => ScreenUtil().setSp(_fontSize30);
  static double get fontSize32 => ScreenUtil().setSp(_fontSize32);
  static double get fontSize34 => ScreenUtil().setSp(_fontSize34);
  static double get fontSize36 => ScreenUtil().setSp(_fontSize36);

  static FontWeight get thin => FontWeight.w100;
  static FontWeight get extraLight => FontWeight.w200;
  static FontWeight get light => FontWeight.w300;
  static FontWeight get regular => FontWeight.w400;
  static FontWeight get medium => FontWeight.w500;
  static FontWeight get semiBold => FontWeight.w600;
  static FontWeight get bold => FontWeight.w700;
  static FontWeight get extraBold => FontWeight.w800;
  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
    return base.copyWith(
      headline1: base.headline1.copyWith(fontFamily: fontName),
      headline2: base.headline2.copyWith(fontFamily: fontName),
      headline3: base.headline3.copyWith(fontFamily: fontName),
      headline4: base.headline4.copyWith(fontFamily: fontName),
      headline5: base.headline5.copyWith(fontFamily: fontName),
      headline6: base.headline6.copyWith(fontFamily: fontName),
      button: base.button.copyWith(fontFamily: fontName),
      caption: base.caption.copyWith(fontFamily: fontName),
      bodyText1: base.bodyText1.copyWith(fontFamily: fontName),
      bodyText2: base.bodyText2.copyWith(fontFamily: fontName),
      subtitle1: base.subtitle1.copyWith(fontFamily: fontName),
      subtitle2: base.subtitle2.copyWith(fontFamily: fontName),
      overline: base.overline.copyWith(fontFamily: fontName),
    );
  }

   static ThemeData buildLightTheme() {
    final Color primaryColor = HexColor('#005180');
    final Color secondaryColor = HexColor('#54D3C2');
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      buttonColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      accentColor: secondaryColor,
      canvasColor: Colors.white,
      backgroundColor: const Color(0xFFFFFFFF),
      scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      errorColor: const Color(0xFFB00020),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      platform: TargetPlatform.iOS,
    );
  }
}
class TTFColors {
  static const List colors = [
    Color(0xFFfb6b17),
    Color(0xFF36a5ff),
    Color(0xFFFA8072),
    Colors.green,
    Color(0xFF884ea0),
    Color(0xFF00d793),
    Color(0xFFec7063),
    Color(0xFF17a589),
    Color(0xFFFFA07A),
    Color(0xFF2ecc71),
    Colors.blue,
    Color(0xFFfa8f52),
    Color(0xFF52d5ba),
    Color(0xFF9b59b6)
  ];
  static  Color get blue => Colors.blue;
  static  Color get red => Colors.red;
  static  Color get yellow => Colors.yellow;
  static const MaterialColor navy = MaterialColor(
    0xFF1e4f92,
    <int, Color>{
      50: Color(0xFFa5c1f3),
      100: Color(0xFF628ee7),
      200: Color(0xFF1e4f92),
      300: Color(0xFF162A49),
      400: Color(0xFF162A49),
      500: Color(0xFF162A49),
      600: Color(0xFF162A49),
      700: Color(0xFF162A49),
      800: Color(0xFF162A49),
      900: Color(0xFF162A49),
    },
  );
  static const MaterialColor navy2 = MaterialColor(0xFF0d4171, <int, Color>{
    50: Color(0xFF162A49),
    100: Color(0xFF162A49),
    200: Color(0xFF162A49),
    300: Color(0xFF162A49),
    400: Color(0xFF162A49),
    500: Color(0xFF162A49),
    600: Color(0xFF162A49),
    700: Color(0xFF162A49),
    800: Color(0xFF162A49),
    900: Color(0xFF162A49),
  });
}
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}