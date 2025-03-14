// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:myth/generated/l10n.dart';

class TabButtonModel {
  IconData active_icon;
  IconData? inactive_icon;
   double? size;
  String? title;
  TabButtonModel({
    required this.active_icon,
    required this.inactive_icon,
     this.size,
   
    required this.title,}
  );
}
 BottomBarItem bottomBarItem({required TabButtonModel tab,}){
  return BottomBarItem(
        inActiveItem: Icon(
          tab.inactive_icon!=null?tab.inactive_icon:tab.active_icon,
            size:tab.size??20,
            color: Colors.white,
        ),
        activeItem: Icon(
          tab.active_icon,
          size:tab.size??20,
          color: Colors.white,
        ),
        // itemLabel:tab.title,
        itemLabelWidget: Text(tab.title??"" , maxLines: 1 , 
        overflow: TextOverflow.ellipsis,) 
  );
}

showConfirmationDialog({required BuildContext context , required String title , required String body }) {
    return  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[ 
            TextButton(
              child: Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(context).pop(false); // Return false when cancelled
              },
            ),
            TextButton(
              child: Text(S.of(context).confirm),
              onPressed: () {
                Navigator.of(context).pop(true); // Return true when confirmed
              },
            ),
          ],
        );
      },
    );
  }




