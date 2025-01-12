import 'package:blutooth_app/styles/colors.dart';
import 'package:flutter/material.dart';

extension TextStyles on TextStyle {
  TextStyle get semiBold => copyWith(
        fontWeight: FontWeight.w600,
        // fontFamily: LanguageController.to.currentFontFamily,
      );
  TextStyle get bold => copyWith(
        fontWeight: FontWeight.w700,
        // fontFamily: LanguageController.to.currentFontFamily,
      );
  TextStyle get meduim => copyWith(
        fontWeight: FontWeight.w500,
        // fontFamily: LanguageController.to.currentFontFamily,
      );
  TextStyle get small => copyWith(
        fontWeight: FontWeight.normal,
        // fontFamily: LanguageController.to.currentFontFamily,
      );
  TextStyle get s7 => copyWith(fontSize: 7);
  TextStyle get s8 => copyWith(fontSize: 8);
  TextStyle get s9 => copyWith(fontSize: 9);
  TextStyle get s10 => copyWith(fontSize: 10);
  TextStyle get s11 => copyWith(fontSize: 11);
  TextStyle get s12 => copyWith(fontSize: 12);
  TextStyle get s13 => copyWith(fontSize: 13);
  TextStyle get s14 => copyWith(fontSize: 14);
  TextStyle get s15 => copyWith(fontSize: 15);
  TextStyle get s16 => copyWith(fontSize: 16);
  TextStyle get s17 => copyWith(fontSize: 17);
  TextStyle get s18 => copyWith(fontSize: 18);
  TextStyle get s19 => copyWith(fontSize: 19);
  TextStyle get s20 => copyWith(fontSize: 20);
  TextStyle get s21 => copyWith(fontSize: 21);
  TextStyle get s22 => copyWith(fontSize: 22);
  TextStyle get s23 => copyWith(fontSize: 23);
  TextStyle get s24 => copyWith(fontSize: 24);
  TextStyle get s25 => copyWith(fontSize: 25);
  TextStyle get s26 => copyWith(fontSize: 26);
  TextStyle get s27 => copyWith(fontSize: 27);
  TextStyle get s28 => copyWith(fontSize: 28);
  TextStyle get s29 => copyWith(fontSize: 29);
  TextStyle get s30 => copyWith(fontSize: 30);
  TextStyle get s31 => copyWith(fontSize: 31);
  TextStyle get s32 => copyWith(fontSize: 32);
  TextStyle get s33 => copyWith(fontSize: 33);
  TextStyle get s34 => copyWith(fontSize: 34);
  TextStyle get s35 => copyWith(fontSize: 35);

  TextStyle get greyLight => copyWith(color: AppColors.lightGrey);
  TextStyle get primary => copyWith(color: AppColors.primary);
  TextStyle get primaryDark => copyWith(color: AppColors.primaryDark);
  TextStyle get white => copyWith(color: AppColors.white);
  TextStyle get black => copyWith(color: AppColors.black);
  TextStyle get dark => copyWith(color: AppColors.dark);
  TextStyle get grey => copyWith(color: AppColors.grey);
  TextStyle get darkGrey => copyWith(color: AppColors.darkGrey);

  TextStyle colorize(Color color) {
    return copyWith(color: color);
  }
}
