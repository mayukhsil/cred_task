import 'dart:ui';

class AppColor {
  static const Color appBlack = Color(0xFF000000);
  static const Color appWhite = Color(0xFFFFFFFF);
  static const Color appIceGrey = Color(0xFFd4d5d9);
  static const Color appGrey = Color(0xFF9F9F9F);
  static const Color appDarkGrey = Color(0xFF202020);
  static const Color appGreyShade1 = Color(0xFF393433);
  static const Color appGreyShade2 = Color(0xFF453f3d);
  static const Color appGreyShade3 = Color(0xFF57504c);
  static const Color appBg = Color(0xFF02060D);
  static const Color appPrimary = Color(0xFF29a8ab);

  final List _emiCardColors = [
    const Color(0xFF43343d),
    const Color(0xFF7d7290),
    const Color(0xFF59698b),
    const Color(0xFF789c92),
  ];

  List get emiCardColors => _emiCardColors;
}