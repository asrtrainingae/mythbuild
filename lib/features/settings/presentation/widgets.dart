import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/services/device_utils.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/constants/shadows.dart';
import 'package:myth/utils/constants/sizes.dart';
import 'package:myth/utils/server/server_config.dart';
import 'package:myth/utils/text_styles.dart';
import 'package:myth/widgets/containers.dart';
import 'package:url_launcher/url_launcher_string.dart';
Widget myDivider(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Divider(
      color:Colors.grey
    ),
  );
}

class LanguageDialog extends ConsumerWidget  {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            
            onPressed: () {
              // Handle English language selection
              // S.load(Locale("en"));
              // ref.read(localeProvider.notifier).setLocale(Locale('en'));
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              // primary: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 15.0),
            ),
            child: Center(
              child: Text(
                S.of(context).english,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              // Handle Arabic language selection
              // ref.read(localeProvider.notifier).setLocale(Locale('ar'));
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              // primary: Colors.white,
              side: BorderSide(color: Colors.grey, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 15.0),
            ),
            child: Center(
              child: Text(
                S.of(context).arabic,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  
  
  }
}
class HelpCenterDialog extends StatelessWidget {



  const HelpCenterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              launchUrlString("tel://${SocialMedia.phone}"); 
            },
            style: ElevatedButton.styleFrom(
              // primary: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 15.0),
            ),
            child: Center(
              child: Text(
                S.of(context).call,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              launchUrlString("https://wa.me/${SocialMedia.whatsappNumber}");
            },
            style: ElevatedButton.styleFrom(
              // primary: Colors.green,
              side: BorderSide(color: Colors.grey, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 15.0),
            ),
            child: Center(
              child: Text(
                S.of(context).arabic,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  
  }
}



class TProfileCustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
    path.lineTo(0, size.height);

    final firstCurve=Offset(0, size.height-20);
    final lastCurve=Offset(30, size.height-20);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondFirstCurve=Offset(0, size.height-20);
    final secondLastCurve=Offset(size.width-30, size.height-20);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy, secondLastCurve.dx, secondLastCurve.dy);

    final thirdFirstCurve=Offset(size.width, size.height-20);
    final thirdLastCurve=Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy, thirdLastCurve.dx, thirdLastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}


class TProfileCurvedEdgeWidget extends StatelessWidget {
  const TProfileCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TProfileCustomCurvedEdges(),
      child: child,
    );
  }
}


class TProfileHeaderContainer extends StatelessWidget {
  const TProfileHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TProfileCurvedEdgeWidget(
      child: Container(
        color: AppColors.primary,
        height: AppDimensions.of(context).height/4,
        width: double.infinity,

        /// -- if size.infinite is not true error occurred
        child: Stack(
          children: [
            /// -- Background Custom Shapes
            child,
          ],
        ),
      ),
    );
  }
}

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Center( 
          child: Text(
              "${S.of(context).profile}", style: black18Bold)),
      // leading: 
        actions: [
          IconButton(
            icon: Badge(
              label:Text("1"),
              child: Icon(Icons.notifications, color:Colors.white)) ,onPressed: () {
          Navigator.of(context).pushNamed(Routes.notifications);
        })]
    );
  }
}



class PersonalInformationWidget extends StatelessWidget {
  const PersonalInformationWidget({
    super.key,
    required this.email,
    required this.phoneNum,
    required this.working_hours,
    required this.hospitalName,
    required this.patientNumber,
    required this.userName,
    required this.careCenter,
  });

  final String userName;
  final String email;
  final String phoneNum;
  final String working_hours;
  final String hospitalName;
  final String careCenter;
  final int? patientNumber;

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "${S.of(context).name}",
      "${S.of(context).email}",
      "${S.of(context).phone_number}",
      "${S.of(context).care_center_name}",
      // "patientNumber"
    ];
    List<String> info = [
      userName,
      email,
      "+971${phoneNum.replaceFirst(RegExp('0'), ' ')}",
      careCenter,
      // "$patientNumber"
    ];
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: titles.length+1,
      itemBuilder: (BuildContext context, int index) {
        return titles.length == index ? SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.md,
                vertical: TSizes.defaultSpace
                ),
            child: ElevatedButton(
              onPressed: (){},
              child: Text(
                "Update",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(
                  fontFamily: "Cairo",
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ): InformationItemWidget(
          title: titles[index],
          label: info[index],
          isEmailOrPhone: index == 1 || index == 2 ? true : false,
        );
      },
    );
  }
}



class InformationItemWidget extends StatelessWidget {
  const InformationItemWidget({
    super.key,
    required this.label,  this.isEmailOrPhone=false, required this.title,
  });

  final String title;
  final String label;
  final bool isEmailOrPhone;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      backgroundColor: AppColors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.symmetric(horizontal:TSizes.md,vertical: TSizes.sm),
      borderColor: AppColors.grey,
      showBorder: true,
      shadow: TShadowStyle.containerShadow,
      child: Row(
        children: [
          Text(
              " $title",
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          Text(
            " $label",textDirection: isEmailOrPhone?TextDirection.ltr:null,
            maxLines: 1, softWrap: true , overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}