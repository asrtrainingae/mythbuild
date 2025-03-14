import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:myth/features/appointments/data/models/appointment.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/app_colors.dart';

Widget dropDown({required IconData icon ,required DropdownButton dropDownButton}){
  return Container(
          margin: EdgeInsets.only(bottom:20),
          // padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [AppColors.primary , Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
            boxShadow: [
              BoxShadow(color: Colors.grey , 
              offset: Offset(-5,5),
              spreadRadius: 2,
              blurRadius: 10
              )
            ],
          ),
          child: ListTile(
        trailing: Icon(Icons.arrow_drop_down),
        leading: Icon(icon),
        title: DropdownButtonHideUnderline(
          child: dropDownButton
        ),
      ),
    );
}

Widget buildAppointmentCard({required Appointment appointment , required BuildContext context, required ref ,}){
  return InkWell(
    onTap: (){
      // Navigator.of(context).pushNamed(Routes.edit_appointment ,arguments: appointment);
    },
    child:Container(
      height: 58,
      margin: const EdgeInsets.only(bottom: 10),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:Color(0xFF3BB700).withOpacity(0.3),
      ),
      child: Center(
        child:Text("start date here")
      ),
    ));
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
