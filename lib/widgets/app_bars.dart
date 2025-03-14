import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/extensions.dart';
import 'package:myth/utils/text_styles.dart';
import 'package:myth/widgets/buttons.dart';
import 'package:myth/widgets/custom_widgets.dart';


PreferredSize AppBarCureved({required String title , required BuildContext context }){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.primary , // navigation bar color
        statusBarColor: AppColors.primary , // status bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icons' color
    ));
  return PreferredSize(
    preferredSize: Size .fromHeight(70),
    child:  TCurvedEdgeWidget(
                  child: Container(
                    height:100,
                    width:double.infinity, 
                    color:AppColors.primary ,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Padding(
                          padding: const EdgeInsets.only(bottom:8.0),
                          child: IconButton(onPressed:(){
                            Navigator.of(context).pop();
                            } , icon: Icon(Icons.arrow_circle_left_outlined, color: Colors.white)),
                        ),
                         Text(
                        title,
                        textAlign:  TextAlign.center,
                        style: TextStyle(fontSize: 24 , color: Color.fromARGB(255, 36, 36, 36) , 
                        fontWeight: FontWeight.bold),
                      ),
                      SizedBox()
                      ]),),
                    
                ),
  );
 }
 PreferredSizeWidget fullAppBar({required context  }){
   return AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: primary_color),
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.settings_page);
          },
        ),
        centerTitle: true ,
        title: Image.asset('assets/images/logo.png', height: 40), // Replace with your logo
        actions: [
          IconButton(
              icon: const Icon(Ionicons.alarm_outline , color: primary_color),
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.upcoming_appointments);
              },
            ),
          IconButton(
            icon: Icon(Icons.shopping_cart , color: primary_color),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.cart);
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications , color: primary_color),
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.notifications);
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
      
  }
PreferredSize myAppBar({required String title , bool? showBackButton , required BuildContext context , bool?hideNotification}){
  return PreferredSize(
      preferredSize: Size(double.infinity , 70), 
      child: TCurvedEdgeWidget(
                  child: Container(
                    height:109,
                    width:double.infinity, 
                    color:AppColors.primary ,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        // Navigator.of(context).canPop()?
                        // ModalRoute.of(context)!.isFirst?
                        showBackButton!=false?
                        Padding( 
                          padding: const EdgeInsets.only(bottom:8.0),
                          child: IconButton(onPressed:(){
                            Navigator.of(context).pop();} ,  
                          icon:  Icon(
                            Intl.getCurrentLocale()=="ar"?Icons.arrow_circle_right_outlined :Icons.arrow_circle_left_outlined, 
                            color: Colors.white , size: 34,)),
                        ):
                        IconButton(icon: const Icon(Icons.menu  , color:Colors.white), onPressed: () {
                          Navigator.of(context).pushNamed(Routes.settings_page);
                        },),
                        
                        Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20 , color: Color.fromARGB(255, 36, 36, 36) , 
                        fontWeight: FontWeight.bold),
                                          ),
                                          hideNotification==true?SizedBox():
                                           IconButton(onPressed: (){
                                              Navigator.of(context).pushNamed(Routes.notifications);
                                            }, icon: 
                                            Badge(
                                            label: Text("0"), child:Icon(Icons.notifications , color:Colors.white)),
                                          )
                      ],
                    ),),
                    
                ),);
  
}



Widget AppBarWithSearch({double? padding ,required BuildContext context}){
  double gap = 14; 
  TextEditingController _searchController = TextEditingController();
  return Padding(
    padding:  EdgeInsets.all(padding??10.0),
    child: Row(
                  children: [
                    IconButton2(
                      icon:"Assets.location",
                      onPressed: (){
                        // Get.to(settings_page2());
                      }
                    ),
                    SizedBox(width:gap),
                     Expanded(
                        child: Container(
                          height:45,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        border: Border.all(color:AppColors.secondary , width: 2),
                        boxShadow: [ 
                          BoxShadow(
                            offset: Offset(0,2),
                            color: Colors.black.withOpacity(.25),
                            blurRadius: 18,
                            spreadRadius: 0
                          )
                        ]
                      ),
                      child:TextField(
                        onSubmitted: (value){
                          // Navigator.of(context).pushNamed(Routes.services, arguments: SearchModel(ad_title: value));
                        },
                        controller: _searchController,
                        textAlignVertical:TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon:Container(
                            padding:EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: Icon(
                              Icons.search , color:AppColors.primary),
                          ),
                          hintText:"   search here",
                          //borders
                          border: InputBorder.none , 
                      )
                    )
                      ),
                    ),
                    SizedBox(width:gap),
                    IconButton2(
                      icon:"Assets.notification",
                      onPressed: (){
                        // Get.to(NotificationScreen());
                        }
                    ),
                  ],
                  ),
  );
}

