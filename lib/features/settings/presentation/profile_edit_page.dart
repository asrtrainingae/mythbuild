import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:myth/widgets/app_bars.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  const ProfileEditPage({super.key});

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}
class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    // final userProvider = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: myAppBar(title: S.of(context).edit_profile , context:context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: 20),
              // // Profile Card
              // CircleAvatar(
              //               radius: 50,
              //                backgroundImage:  NetworkImage(
              //               userProvider.user!.image ?? ""
              //             ),
              //             onBackgroundImageError: (err,s) => AssetImage("assets/images/user.png")
              //             ),
              // build_input_field(title: S.of(context).name , value:userProvider.user!.fullName!),  
              // SizedBox(height: 10),    
              // build_input_field(title: S.of(context).email  , value: userProvider.user!.email??""), 
              // SizedBox(height: 10),    
              // // build_input_field(title: S.of(context).password  , value:"12345678" , hideText: true), 
              // SizedBox(height: 10),    
              // build_input_field(title: S.of(context).phone_number  , value: userProvider.user!.phoneNumber??"" , preIcon: Icons.call),    
              // SizedBox(height: 10),     
              // // build_input_field(title: S.of(context).location  , value: userProvider.user!.email??"" , sufIcon: Icons.pin_drop),  
              // SizedBox(height: 20),
              // // Edit Profile Button
              // // mainButton(text: S.of(context).save_changes , pressed: (){
              // //   Map<String,String> data = {"FirstName" : "Alina" , "PhoneNumber" :"21" };
              // //   ref.read(authNotifierProvider.notifier).updateProfile(data);
              // // })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Icon(
              size : 20 ,
              icon, color: const Color.fromARGB(255, 0, 0, 0) ,)),
          SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
  Widget build_input_field({required String title ,required String value ,bool? hideText , IconData? preIcon , IconData? sufIcon }){
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: black_16_bold,),
                SizedBox(height: 5,),
                TextFormField(
                  
                  obscureText: hideText?? false ,
                  initialValue: value,
                 decoration: InputDecoration(
                  suffixIcon: sufIcon!=null? Icon(sufIcon):null,
                  prefixIcon: preIcon!=null? Icon(preIcon):null,
                hintText: "Email",
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:BorderSide(color: Colors.grey)),
                fillColor: Colors.transparent
              ),
                )
              ],
            );
  }
}