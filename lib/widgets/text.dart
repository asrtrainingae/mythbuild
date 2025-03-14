import 'package:flutter/material.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/text_styles.dart';

Widget AlignedText(text, {TextStyle? style}){
  return Row(
                  children: [
                    Text(text , style: style??secondary18Bold),
                  ],
                );
}

Widget TextLine(String text , {int? lines ,TextAlign? textAlign,  TextStyle? style}) {
  return Text(text ,
                            maxLines: lines ?? 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign:textAlign?? TextAlign.center,style: style??null,);
}
Widget TextTitle(String text, {bool? showAll , TextStyle? style , String? showAllRoute,  BuildContext? context}){
  if(showAll==true && context==null)
  return Text("please add context");
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text , style: style??secondary18Bold),
                    if(showAll==true)
                    InkWell(
                      onTap: (){
                        if(showAllRoute!=null && context!=null)
                        Navigator.of(context).pushNamed(showAllRoute);
                      },
                      child: 
                      Text("add ar and en json" , style: secondary18Bold))
                  ],
                );
}