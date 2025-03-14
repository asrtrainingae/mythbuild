import 'package:flutter/material.dart';

class TShadowStyle{
  static final textFieldShadow=BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 1,
    offset:const Offset(2, 2),
  );

  static final buttonShadow=BoxShadow(
    color: Colors.black.withOpacity(0.3),
    spreadRadius: 2,
    blurStyle: BlurStyle.inner,
    blurRadius: 7,
    offset:const Offset(0, -2),
  );

  static final containerShadow=BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 3,
    offset:const Offset(0, 2),
  );

  static const neumorphismShadow1=BoxShadow(
    color: Color(0xFFBEBEBE),
    offset: Offset(10, 10),
    blurRadius: 30,
    spreadRadius: 1,
  );
  static const neumorphismShadow2=BoxShadow(
    color: Colors.white,
    offset: Offset(-10, -10),
    blurRadius: 30,
    spreadRadius: 1,
  );


  static const whiteShadow=BoxShadow(
    color: Colors.white,
    spreadRadius: 1,
    blurRadius: 3,
    offset:Offset(0, 2),
  );
  static final imageShadow=BoxShadow(
    color: Colors.black.withOpacity(0.3),
    spreadRadius: 1,
    blurRadius: 3,
    blurStyle: BlurStyle.normal,
    offset:const Offset(0, 4),
  );

  static final clipShadow=BoxShadow(
    color: Colors.black.withOpacity(0.3),
    spreadRadius: 2,
    blurRadius: 3,
    blurStyle: BlurStyle.normal,
    offset:const Offset(4, 4),
  );
}