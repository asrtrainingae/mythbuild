import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/text_styles.dart';
import 'package:myth/utils/text_styles2.dart';


Widget IconButton2({required String icon, void Function()? onPressed}) { 
  return Container(
    width: 45, height: 45,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 2),
              color: Colors.black.withOpacity(.25),
              blurRadius: 18, 
              spreadRadius: 0)
        ]),
    child: IconButton( 
      icon: SvgPicture.asset(icon, width: 40,), 
      onPressed: onPressed,
    ),
  ); 
}
Widget IconButton1({required String icon, void Function()? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: SvgPicture.asset(icon, width: 30,), 
  );
}
Widget RoundedButton(String text , {Function? pressed , bool?withBorder , bool?isDark}) {
  return InkWell(
                    onTap: (){
                      pressed?.call();
                    },
                    
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: isDark==true?AppColors.secondary:AppColors.primary,
                        borderRadius: BorderRadius.circular(50),
                        border:withBorder==true? Border.all(color: AppColors.secondary,width: 2):null,
                      ),
                      child: Center(child: Text(text))),
                  );
}
 
 
Widget ServiceButton(String text , {Function? pressed, String? date}){
  Color inactiveColor = Colors.grey.shade200;
  return Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: GestureDetector(
                    onTap: () {
                      pressed?.call();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: inactiveColor,
                        borderRadius: BorderRadius.circular(30),
                        border:Border.all(color:Colors.white , width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                          text,
                          style: TextStyle(
                            color: Colors.blueGrey.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "$date",
                          style: TextStyle(
                            color: Colors.blueGrey.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )],
                      ),
                    ),
                  ),
  );
}
Widget GlossyButton(String text, {Function? pressed}){
  return InkWell(
    onTap: (){
      pressed?.call();
    },
    child: Container(
                      width:double.infinity,
                      height:60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets.button1" ),
                          fit: BoxFit.contain
                        )
                      ),
                      child: Center(
                        child: Text(text),
                      ),
                     ),
  );

}


Widget mainButtonPrimary({required String text , pressed}){
  return ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: AppColors.primary
                                                  
                                                ),
                                                onPressed: (){pressed();}, child: Text(text ,style: white_16,));
}

Widget mainButton({text ,onTap , fontStyle , isDisabled}) {

  return InkWell(
                  onTap: (){
                    onTap();
                  },
                    
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: isDisabled==true?const Color.fromARGB(255, 135, 141, 156) :AppColors.secondary,
                        borderRadius: BorderRadius.circular(22)
                      ),
                      child: Center(child: Text(text , style: white_16_bold))),
  );
}