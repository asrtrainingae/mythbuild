import 'package:flutter/material.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/text_styles.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:myth/widgets/app_bars.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: S.of(context).services, context:context , showBackButton:false),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).services_types , style: secondary18Bold,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RoundedButtonAppointment(text:S.of(context).speech_treatment , image: Assets.bill , context: context , is_daily:true),
                  RoundedButtonAppointment(text:S.of(context).functional_treatment, image: Assets.calendar , context: context , is_daily:false),
                  RoundedButtonAppointment(text:S.of(context).natural_treatment , image: Assets.calendar , context: context , is_daily:false),
                ],
              ),
            ),
          ],
        )));
  }

  Widget RoundedButtonAppointment({required String image , required String text , required BuildContext context , required bool is_daily}) {
  double size  = 180;
  return InkWell(
    onTap: (){
        Navigator.of(context).pushNamed(Routes.service , arguments: text);
    },
    child: Container(
      width: size, height:size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.rounded_button_service))
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(image),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:8.0),
              child: Text(text.replaceFirst(" ", "\n") , textAlign: TextAlign.center,style: primary_18_bold,),
            ),
            ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                      foregroundColor: AppColors.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.service, arguments: text);
                    },
                    child: Text(S.of(context).more),
                  ),
          ],
          ),
      ),
      // color: Colors.redAccent,
    ),
  );
  }
}