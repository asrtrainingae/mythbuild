import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myth/features/notifications/bloc/notifications_bloc.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/widgets/app_bars.dart';
import 'package:myth/widgets/error_and_loading.dart';
import 'package:timeago/timeago.dart' as timeago;


class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  
  List icons = [Ionicons.alarm_outline, Ionicons.newspaper_outline];
   @override
  Widget build(BuildContext context) { 
    return Scaffold(
        appBar: myAppBar(title: S.of(context).notifications , context:context , hideNotification: true),
          body: BlocBuilder<NotificationsBloc, NotificationsState>(
            builder: (context, state) {
              return state.when(
                loading: ()=>Loading(), 
                success: (notis){
                  return ListView.builder(padding: EdgeInsets.all(16.0),
                  itemCount: notis.length,
                  itemBuilder: (context, index) {
                    final notification = notis[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color:Color.fromARGB(255, 217, 229, 255),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child:  Icon(
                                getIconFromType(context, notification.type??""),
                                color: title_colors,
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 2 ,
                                        child: Text(
                                        // notification.title??"",
                                        getNotificationType(context, notification.type??""),
                                        maxLines: 1, softWrap: true,
                                        overflow:TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:title_colors,
                                        ),
                                      ),
                                      ),
                                      Flexible(
                                        flex: 1 ,
                                        child: Text(
                                          timeago.format(DateTime.parse(notification.createDate!)),
                                          maxLines: 1, softWrap: true,
                                        overflow:TextOverflow.ellipsis,),
                                    
                                      ),
                                      ],
                                  ),
                                  SizedBox(height: 4.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        flex: 2 ,
                                        child: Text(
                                        notification.body??"",
                                        maxLines: 1, softWrap: true,
                                        overflow:TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      ),
                                      // Flexible(
                                      //   flex: 1 ,
                                      //   child: ElevatedButton(
                                      //     onPressed: () async {
                                      //       final res  = await showModalBottomSheet(
                                      //         isScrollControlled:true,
                                      //         elevation:8,
                                      //         // backgroundColor: Colors.red ,
                                      //         context: context, builder: (builder){
                                      //           return Container(
                                      //             height:250,
                                      //             child: Center(
                                      //               child:Column(
                                      //                 mainAxisAlignment: MainAxisAlignment.center,
                                      //                 children: [
                                      //                   Text("Reminder" , style:black_20_bold),
                                      //                   const Padding(
                                      //                     padding: const EdgeInsets.symmetric(horizontal: 18.0 , vertical: 8.0),
                                      //                     child: Divider(color:Colors.grey),
                                      //                   ),
                                      //                   Padding(
                                      //                     padding:  EdgeInsets.symmetric(vertical: 8.0 , horizontal:18),
                                      //                     child: Text("The patient will be referred to the following doctor." , textAlign: TextAlign.center , 
                                      //                     style:TextStyle(fontSize: 18)),
                                      //                   ),
                                      //                    mainButtonPrimary(text: "Ok" ,pressed: (){return Navigator.of(context).pop(true);})
                                      //                 ],
                                      //               )),);
                                      //         });
                                          
                                      //     if(res==true){
                                      //       Navigator.of(context).pushNamed(Routes.add_patient);
                                      //     }
                                      //     }, child: Text("View")),
                                    
                                      // ),
                                      ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16.0),
                            
                          ],
                        ),
                      ),
                    );
                  }
                );
                }, error: (error)=>ErrorWidget(error));
            },
          ),
    );
  }
}
String getNotificationType(BuildContext context , String type){
  switch (type){
    case "1" :{
      return S.of(context).reminder;
    }case "2" :{
      return S.of(context).notice;
    }
    case "3" :{
      return S.of(context).status_update;
    }
    case "4" :{
      return S.of(context).birth_day;
    }
    default :{
       return S.of(context).reminder;
    }
  }
}
IconData getIconFromType(BuildContext context , String type){
  switch (type){
    case "1" :{
      return IconData(0xe901 ,  fontFamily: "notifications",);
    }case "2" :{
      return IconData(0xe902 ,  fontFamily: "notifications",);
    }
    case "3" :{
      return Icons.person_add_rounded;
    }
    case "4" :{
      return IconData(0xe900 ,  fontFamily: "notifications",);
    }
    default :{
      return IconData(0xe901 ,  fontFamily: "notifications",);
    }
  }
}