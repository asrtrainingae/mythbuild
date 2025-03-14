import 'package:flutter/material.dart';
import 'package:myth/utils/app_colors.dart';

TextStyle white_16 = TextStyle(
                    color: Colors.white,fontSize: 16
                  );
TextStyle grey_16 = TextStyle(
                    color: Colors.grey,fontSize: 16
                  );
TextStyle white_16_bold = TextStyle(
                    color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold
                  );
TextStyle white_14_bold = TextStyle(
                    color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold
                  );
TextStyle black_16 = TextStyle(
                    color: Colors.black,fontSize: 16
                  );                 
TextStyle black_16_bold = TextStyle(
                    color: Colors.black,fontWeight: FontWeight.bold
                  );
TextStyle black_18 = TextStyle(
      fontSize: 18,
                    color: Colors.black,fontWeight: FontWeight.bold
                  );
TextStyle title_16_bold = TextStyle(
                    color: AppColors.secondary,fontWeight: FontWeight.bold
                  );
TextStyle primary_18_bold = TextStyle(
  fontSize: 18,
                    color: AppColors.secondary,fontWeight: FontWeight.bold
                  );
TextStyle black_20_bold = TextStyle(
                    color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold
                  );
TextStyle black_20 = TextStyle(
                    color: Colors.black,fontSize: 20
                  );
TextStyle black_24_bold = TextStyle(
                    color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold
                  );
TextStyle white_22_bold  =TextStyle(
                    color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold
                  );
TextStyle title_big_Style = TextStyle(
              fontSize: 38 ,
              fontWeight: FontWeight.bold ,
              color: title_big_color
              );

TextStyle title_thick_style = TextStyle(
  color: title_big_color ,
  fontSize: 20 , fontWeight: FontWeight.w500
);

TextStyle normal_white = TextStyle(
  color: Colors.white ,
);
TextStyle normal_primary = TextStyle(
  color: Colors.white ,
);

TextStyle normal_paragraph = TextStyle(
  color: Colors.black ,
  fontSize: 18
);

TextStyle normal_paragraph_grey = TextStyle(
  color: Colors.grey ,
  fontSize: 18
);

TextStyle small_paragraph_black = TextStyle(
  color: title_big_color ,
  fontSize: 16
);

TextStyle bold_paragraph = TextStyle(
  color: Colors.black ,
  fontSize: 18 ,
  fontWeight: FontWeight.bold
);

TextStyle bold_paragraph_grey = TextStyle(
  color:  Colors.grey ,
  fontSize: 18 ,
  fontWeight: FontWeight.bold
);

TextStyle bold_paragraph_black= TextStyle(
  color:  title_big_color ,
  fontSize: 18 ,
  fontWeight: FontWeight.bold
);
///
///
///
///
TextStyle cart_product_count = TextStyle(
              fontSize: 18 ,
              fontWeight: FontWeight.bold ,
              color: title_big_color
              );

TextStyle price_small = TextStyle(
              fontSize: 18 ,
              fontWeight: FontWeight.bold ,
              color: primary_color
              );

              TextStyle price_bold_grey= TextStyle(
              fontSize: 20 ,
              fontWeight: FontWeight.bold ,
              color: title_big_color
              );

Color blackColor = Color(0xFF1C1F1E);
class AppTextStyles {
  static const String fontFamily = 'Helvetica';

  /// Text style for body
  static const TextStyle bodyLg = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodySm = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle bodyXs = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w300,
  );

  /// Text style for heading

  static const TextStyle h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
}

BoxDecoration containerDecLinearWithShadow({double? borderRadius}){
  return BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey , 
          offset: Offset(-2,2),
          spreadRadius: 1,
          blurRadius: 4
          )
        ],
        borderRadius: BorderRadius.circular(borderRadius!=null?borderRadius:6),
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 107, 152, 250) , primary_color_light , Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      );
}
LinearGradient linear_grad = LinearGradient(
          colors: [primary_color_light , primary_color_light , Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        );
