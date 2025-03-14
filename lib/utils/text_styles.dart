 
    library text_style;
    import 'package:flutter/material.dart';
import 'package:myth/utils/app_colors.dart';
    // 
    mixin Font implements FontWeight  { 
        static FontWeight get l => FontWeight.w300;
        static FontWeight get n => FontWeight.w400;
        static FontWeight get sb => FontWeight.w500;
        static FontWeight get b => FontWeight.w700;
    }
    // 
    class AppTextStyle extends TextStyle {

        static TextStyle get header => TextStyle();
    }
 
    class TStyles { 
      static const bigNumberStyle = TextStyle(color:AppColors.secondary , fontWeight: FontWeight.bold , fontSize: 40);
      static const bigNumberStyleWhite = TextStyle(color:AppColors.white , fontWeight: FontWeight.bold , fontSize: 40);
      static const secondary18Bold = TextStyle(color:AppColors.secondary , fontWeight: FontWeight.bold , fontSize: 18);
      static const secondary14Bold = TextStyle(color:AppColors.secondary , fontWeight: FontWeight.bold , fontSize: 14);
    }

const secondary16 = TextStyle(color:AppColors.secondary  , fontSize: 16);
const secondary16Bold = TextStyle(color:AppColors.secondary , fontWeight: FontWeight.bold , fontSize: 16);
//18 is used for page sub titles
const secondary18Bold = TextStyle(color:AppColors.secondary , fontWeight: FontWeight.bold , fontSize: 18);
const white18Bold = TextStyle(color:AppColors.white , fontWeight: FontWeight.bold , fontSize: 18);
const black18Bold = TextStyle(color:AppColors.black , fontWeight: FontWeight.bold , fontSize: 18);
const black20Bold = TextStyle(color:AppColors.black , fontWeight: FontWeight.bold , fontSize: 20);
const secondary2Bold = TextStyle(color:AppColors.secondary , fontWeight: FontWeight.bold , fontSize: 20);
    