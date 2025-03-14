import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/features/appointments/bloc/appointment_bloc.dart';
import 'package:myth/features/appointments/data/models/appointment.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:myth/widgets/app_bars.dart';
import 'package:myth/widgets/error_and_loading.dart';

import 'appointments_fixed_details.dart';

class FixedAppointmentsPage extends StatefulWidget {
  const FixedAppointmentsPage({super.key});

  @override
  State<FixedAppointmentsPage> createState() => _FixedAppointmentsPageState();
}

class _FixedAppointmentsPageState extends State<FixedAppointmentsPage> {
   
  Appointment? nextAppointment;
  @override
  Widget build(BuildContext context) {
    List<Day> days = [
      Day(id:"monday", name: S.of(context).monday),
      Day(id:"tuesday", name: S.of(context).tuesday),
      Day(id:"wednesday", name: S.of(context).wednesday),
      Day(id:"thursday", name: S.of(context).thursday),
      Day(id:"friday", name: S.of(context).friday),
      Day(id:"saturday", name: S.of(context).saturday),
      // Day(id:"sunday", name: S.of(context).sunday),
    ];
    return Scaffold(
        appBar:
            myAppBar(title: S.of(context).fixed_appointments, context: context),
        body: BlocBuilder<AppointmentBloc, AppointmentState>(
          builder: (context, state) {
            return state.when(loading: ()=>Loading(), 
              success: (canceledAppointments , successAppointments){
              //   nextAppointment = successAppointments.firstWhere(
              //   (ap) => ap.startDate != null && ap.startDate!.isAfter(DateTime.now()),// Return null if no match is found
              //   // orElse: ()=>null
              // );
              final myAppointments = successAppointments.where( (ap) => ap.startDate != null && ap.startDate!.isAfter(DateTime.now()),// Return null if no match is found
             ); 
            print("success is ${successAppointments[0].startDate}");     
             nextAppointment = myAppointments.isNotEmpty?myAppointments.first:null;
             print("next appo ${nextAppointment?.toJson()}");
             if(nextAppointment==null){
              return Center(child:Text("No Next Appointment"));
             }
                return SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GridView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                          children: [
                          ...days.map((day)=> RoundedButtonAppointment(
                          appoimtnent:nextAppointment!,
                          text:day.name, context: context, isSelected: day.id==nextAppointment?.fixedDay?.toLowerCase())).toList()
                      //       RoundedButtonAppointment(
                      //           text: S.of(context).monday, context: context),
                      //       RoundedButtonAppointment(
                      //           text: S.of(context).sunday, context: context),
                      //       RoundedButtonAppointment(
                      //           text: S.of(context).tuesday, context: context),
                      //       RoundedButtonAppointment(
                      //           text: S.of(context).wednesday,
                      //           context: context),
                      //       RoundedButtonAppointment(
                      //           text: S.of(context).thursday, context: context),
                      //       RoundedButtonAppointment(
                      //           text: S.of(context).friday, context: context),
                          ]),
                      RoundedButtonAppointment(
                          text: "Saturday", context: context, appoimtnent: nextAppointment!, isSelected: "sunday"==nextAppointment!.fixedDay?.toLowerCase()),
                    ],
                  ),
                ));
              }, error: (error)=> ErrorWidget(error));
          },
        ));
  }
}

Widget RoundedButtonAppointment(
    {required String text, required Appointment appoimtnent ,required BuildContext context ,bool? isSelected}) {
  double size = 200;
  
  return InkWell(
    onTap: () {
      if(isSelected!=true)return;
      Navigator.of(context).push(fixedAppointmentDetails(appoimtnent));
    },
    child: Container(
      width: size, height: size,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(isSelected==true?Assets.rounded_button_appointment_selected:Assets.rounded_button_appointment))),
      child: Center(
        child: Text(
          text.replaceFirst(" ", "\n"),
          textAlign: TextAlign.center,
          style: primary_18_bold,
        ),
      ),
      // color: Colors.redAccent,
    ),
  );
}

class Day{
  String id;
  String name;
  Day({required this.id, required this.name});
}
