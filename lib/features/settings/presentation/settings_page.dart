import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/features/auth/bloc/auth_bloc.dart';
import 'package:myth/features/settings/presentation/widgets.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/server/server_config.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:myth/widgets/app_bars.dart'; 
import 'package:url_launcher/url_launcher_string.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context: context , title: "Menu") ,//myAppBar(title: S.of(context).menu),
      body: Container(
        color:  Colors.white , 
        child: Column(
          children: [
            buildMenuItem(
              icon: Icons.language,
              text: S.of(context).language,
              onTap: () {
                showDialog(context: context, builder: (context){
                  return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: LanguageDialog(),
                );
                });
              },
            ),
            myDivider(),
            buildMenuItem(
              icon: Icons.phone,
              text: S.of(context).contact_us,
              onTap: () {
                launchUrlString("tel://${SocialMedia.phone}");
              },
            ),
            myDivider(),
            buildMenuItem(
              icon: Ionicons.document_outline,
              text: S.of(context).terms_and_conditions,
              onTap: () {
                launchUrlString("https://google.com"); 
              },
            ),
            myDivider(),
            buildMenuItem(
              icon: Ionicons.trash ,
              text: S.of(context).delete_account,
              onTap: () {
                launchUrlString("https://google.com");
              },
            ),
            myDivider(),
            buildMenuItem(
                icon: Icons.logout,
                text: S.of(context).logout,
                textColor: Colors.red,
                onTap: () {
                  print("Hey");
                  BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                  // ref.read(authNotifierProvider.notifier).logout();
                // Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => true);
                Phoenix.rebirth(context);

                  },
              )
          ],
        ),
      ),
    );
  }


  Widget _BuildContainerDivider(){
    return Container(
              height: 8,
              width: double.infinity,
              color: Colors.grey[300]
              );
  }
  Widget buildMenuItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
    Widget? trailing,
    Color? textColor,
  }) {
    return InkWell(
      onTap: (){
        onTap;
      },
      child: Container(
        color:Colors.white ,
        child: ListTile(
          
          leading: Icon(icon, color: textColor!=null? textColor: Colors.blue),
          title: Text(text, style: textColor!=null?TextStyle(color:textColor , fontWeight: FontWeight.bold , fontSize: 16):black_16_bold),
          trailing: trailing ?? Icon(Icons.arrow_forward_ios, color: Colors.grey),
          onTap: onTap,
        ),
      ),
    );
  }
}