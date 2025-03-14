import 'package:flutter/material.dart';

class AppColors {
  
  // App Basic Colors
  static const Color primary=Color(0xFF00A7E8);
  static const Color primary_color=primary;
  static const Color secondary=Color(0xFF163C7A);
  static const Color danger=Color(0xFFFE0000);
  static const Color accent=Color(0xFFb0c7ff);//0xFFC5D7FF
  static const Color inputField=Color.fromARGB(255, 239, 239, 239);//
  static const Color appointmentButtonColor = Color(0x3A3BB700);
  

  // Gradient Colors
  static  Gradient? linerGradient= LinearGradient(
      begin: const Alignment(0.0, 0.0),
      end: const Alignment(1, 1),
      colors: [
        //const Color(0xffC4C4C4),
        white.withOpacity(0.5),
         white.withOpacity(0.8),
      ]
  );

  // Tab Bar Gradient Colors
  static  Gradient tabBarLinerGradient= LinearGradient(
      begin: const Alignment(0.0, 0.0),
      end: const Alignment(1, 1),
      colors: [
        //const Color(0xffC4C4C4),
        primary.withOpacity(0.5),
        primary.withOpacity(0.1),
      ]
  );

  static  Gradient appointmentLinerGradient= LinearGradient(
      begin: const Alignment(0.0, 0.0),
      end: const Alignment(1, 1),
      colors: [
        //const Color(0xffC4C4C4),
        primary.withOpacity(0.3),
        primary.withOpacity(0.1),
      ]
  );

  static  Gradient onBoardingLinerGradient=  LinearGradient(
      begin: const Alignment(0.0, 0.0),
      end: const Alignment(1, 1),
      colors: [
        //const Color(0xffC4C4C4),


        secondary.withOpacity(0.2),
        white.withOpacity(0.2),
      ]
  );
  
  // Text Colors
  static const Color textPrimary=Color(0xFF333333);
  static const Color textSecondary=Color(0xFF6C757D);
  static const Color textWhite=Colors.white;

  // Background Colors
  static const Color light=Color(0xFFF6F6F6);
  static const Color dark=Color(0xFF272727);
  static const Color primaryBackground=Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer=Color(0xFFF6F6F6);
  static  Color darkContainer=white.withOpacity(0.1);

  // Border Colors
  static const Color borderPrimary=Color(0xFFD9D9D9);
  static const Color borderSecondary=Color(0xFFE6E6E6);

  // Error and Validation Colors
  static const Color error=Color(0xFFD32F2F);
  static const Color success=Color(0xFF388E3C);
  static const Color warning=Color(0xFFF57C00);
  static const Color info=Color(0xFF1976D2);

  // Neutral Shades
  static const Color black=Color(0xFF232323);
  static const Color darkerGrey=Color(0xFF4F4F4F);
  static const Color darkGrey=Color(0xFF939393);
  static const Color grey=Color(0xFFE0E0E0);
  static const Color softGrey=Color(0xFFF4F4F4);
  static const Color lightGrey=Color(0xFFF9F9F9);
  static const Color white=Color(0xFFFFFFFF);
  static const yellow_color = Color(0xFFEED046);
  static const red_color = Color(0xFFE50C0C);
  static const green_color = Color(0xFF43A04C);
  static const primary_color_light = Color.fromARGB(255, 197, 215, 255);
  
}


const background_color = Color(0xFFF5F6F8);
const title_big_color = Color(0xFF515C6F);
const primary_color = Color(0xFF00A7E8);
const yellow_color = Color(0xFFEED046);
const red_color = Color(0xFFE50C0C);
const green_color = Color(0xFF43A04C);
const secondary_color = Color.fromARGB(255, 238, 95, 38);
const title_colors = Color(0xFF163C7A);
// const primary_color_light = Color(0xFFFF6969);

var primary_color_light = Color.fromARGB(255, 197, 215, 255);