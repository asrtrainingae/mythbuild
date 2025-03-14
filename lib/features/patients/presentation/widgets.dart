import 'package:flutter/material.dart';
import 'package:myth/features/patients/data/case_model.dart';
import 'package:myth/features/patients/presentation/sessions_page.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/text_styles.dart';
Widget buildCaseCard({required Case userCase , required BuildContext context}){

  return InkWell(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (x)=>SessionsPage(userCase: userCase,)));
    },
    child: Container(
      padding:EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal:20),
      decoration:  BoxDecoration(
        color: primary_color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: CircleAvatar(radius: 40,
              backgroundImage: AssetImage("assets/images/reviews/user2.jpg"),) ),
           Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(userCase.fullName ,textAlign: TextAlign.center, style: white18Bold),
                  // Text(userCase.fullName ,textAlign: TextAlign.center, style: white18Bold),
                ],
              )
            ),
            )
        ],
      )
    ),
  );
}
Widget buildTotalCard({required String total , required String title ,
 Color? color , Function? pressed}){

  return InkWell(
    onTap: (){
      pressed?.call();;
    },
    child: Container(
      padding:EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal:20),
      decoration:  BoxDecoration(
        color: color??AppColors.appointmentButtonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Center(child: Text(total , style:TStyles.bigNumberStyleWhite))),
           Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(right:30.0),
              child: Text(title ,textAlign: TextAlign.center, style: white18Bold)
            ),
            )
        ],
      )
    ),
  );
}

Widget textFieldBig({required String hint}){
  return Container(
    width:double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent[100],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:TextField(
                
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:hint
                ),
                maxLines:5,
                minLines: 3,
              )
            );

}