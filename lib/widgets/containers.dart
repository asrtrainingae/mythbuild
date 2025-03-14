import 'package:flutter/material.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/constants/sizes.dart';
import 'package:myth/widgets/app_bars.dart';



class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = TSizes.cardRadiusLg,
    this.padding,
    this.child,
    this.backgroundColor = AppColors.white,
    this.margin,
    this.showBorder = false,
    this.borderColor = AppColors.darkGrey,
    this.shadow = const BoxShadow(),
    this.gradient,
    this.isGradient = true,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxShadow shadow;
  final Gradient? gradient;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [shadow],
        color: backgroundColor,
        gradient:isGradient? gradient ?? AppColors.linerGradient:null,
        border: showBorder ? Border.all(color: borderColor, width: 0.8) : null,
      ),
      child: child,
    );
  }
}

Widget MyScaffold({required BuildContext context , required Widget child , 
required String title , bool? hideBackButton}) {
  return SafeArea(
    child: Scaffold(
      backgroundColor:Colors.white,
      extendBodyBehindAppBar: true,
      appBar: myAppBar(context: context,  title:title ),
      body: Container(
        padding:EdgeInsets.only(top: 88),
         width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   opacity: 0.4,
          //   image: AssetImage(Assets.background2),
          //   fit:BoxFit.cover)
        ),
        child: child)
    ));
}