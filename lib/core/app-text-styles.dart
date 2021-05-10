import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app-colors.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: Colors.white,
  );

  static final TextStyle titleBold = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.white,
  );

  static final TextStyle listItens = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: Colors.black,
  );

  static final TextStyle buttom = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.white,
  );

  static final TextStyle faults = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: Colors.white,
  );

  static final TextStyle faultsNumber = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    fontSize: 17,
    color: AppColors.primary,
  );

  static final TextStyle login = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: AppColors.lightGrey,
  );

  static final TextStyle heading = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: AppColors.primary,
  );

  static final TextStyle heading15 = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: AppColors.primary,
  );

  static final TextStyle heading17 = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: AppColors.primary,
  );

  static final TextStyle heading22 = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    color: AppColors.primary,
  );

  static final TextStyle body = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: AppColors.grey,
  );

  static final TextStyle bodyLightGrey = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: AppColors.lightGrey,
  );

  static final TextStyle bodyLightPrimary = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: AppColors.primaryLight,
  );

  static final TextStyle forgotPassword = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.primaryLight,
  );
}
