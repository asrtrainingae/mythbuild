import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'package:popover/popover.dart';

  Widget buildExpansionTile(String title, {List<Widget>? children,bool?isExpanded}) {
    return ExpansionTile(
      initiallyExpanded : isExpanded??false,
      backgroundColor: Color(0x82931A),
      collapsedBackgroundColor: Colors.white,
      title: Text(title),
      children: children ?? [],
    );
  }


  Widget buildCategoryTile(String title,String catId) {
    return ListTile(
      title: Text(title),
      onTap: () {
        // Handle navigation or action here
      },
    );
  }
