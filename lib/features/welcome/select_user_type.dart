import 'package:flutter/material.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/text_styles.dart';
import 'package:myth/widgets/buttons.dart';

class SelectUserTypeScreen extends StatelessWidget {
  const SelectUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover)
            ),
            child: Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 55,),
                  
                  Image.asset("Assets.profinder"),
                  SizedBox(
                    height: 10, 
                  ),
                  Text("" ,
                   style: TextStyle(color: Color(0xFF127957) , 
                   fontSize: 24 , fontWeight: FontWeight.bold),),
                   Spacer(flex: 10,),
                   GlossyButton("As User" , pressed:(){
                     Navigator.of(context).pushNamed(Routes.login);}),
                   Spacer(flex: 10,),

                   GlossyButton("As Service Provider" , pressed:(){
                     Navigator.of(context).pushNamed(Routes.login);}),
                  Spacer(flex: 44,),
                  Spacer(flex: 22,),
                ],
              )
            ),
          ),
      ),
    );
  }
}