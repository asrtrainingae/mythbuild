import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/features/appointments/bloc/appointment_bloc.dart';
import 'package:myth/features/appointments/data/models/appointment.dart';
import 'package:myth/features/development/cubit/development_cubit.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/text_styles.dart';
import 'package:myth/widgets/app_bars.dart';
import 'package:myth/widgets/buttons.dart';
import 'package:myth/widgets/error_and_loading.dart';

class AppointmentsFixedDetailsPage extends StatelessWidget {
  Appointment? appointment;
  AppointmentsFixedDetailsPage({required this.appointment});
  @override
  Widget build(BuildContext context) {
    DateTime updatedDateTime =
        appointment!.startDate!.add(Duration(minutes: 30));

    String formattedDate = DateFormat("d-MMM")
        .format(appointment!.startDate!); // Formats to '4-Jul'
    String formattedTimeRange =
        "${DateFormat('h:mm').format(appointment!.startDate!)} - ${DateFormat('h:mm a').format(updatedDateTime)}";

    String dateToShow = "'$formattedDate', '$formattedTimeRange'";

    final buttonLabels = [
      S.of(context).speech_treatment,
      S.of(context).functional_treatment,
      S.of(context).natural_treatment,
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(title: S.of(context).appointments, context: context),
      body: BlocBuilder<AppointmentBloc, AppointmentState>(
        builder: (context, state) {
          return state.when(
            error: (err)=>ErrorWidget(err),
            loading: ()=>Loading(), 
            success: (data , data2)=>
            Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${formattedDate} $formattedTimeRange",
                    style: secondary18Bold),
                SizedBox(
                  height: 8,
                ),
                appointmentCard(
                    formattedDate,
                    formattedTimeRange,
                    appointment!.therapistName ?? "---",
                    AppColors.primary,
                    context),
                SizedBox(
                  height: 16,
                ),
                Text("${S.of(context).details}", style: secondary18Bold),
                SizedBox(
                  height: 16,
                ),

                // for (int i = 0; i < buttonLabels.length; i++)
                ServiceButton(
                    appointment!.appointmentDetails!.first.name ?? "--",
                    pressed: () {
                  // Navigatpr
                }, date: formattedTimeRange),
                Expanded(
                  child: ListView(
                    children: [],
                  ),
                ),
              ],
            ),
          ),);
        },
      ),
    );
  }

  Widget appointmentCard(String date, String time, String name, Color color,
      BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      child: Row(
        children: [
          // Container(
          //   width: 60,
          //   height: 60,
          //   decoration: BoxDecoration(
          //     color: Colors.blue[100],
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          //   child: Center(
          //     child: Text(
          //       date,
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(width: 8),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        time,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        name,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox()
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.white,
                  //     // onPrimary: Colors.black,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     Navigator.of(context)
                  //         .pushNamed(Routes.appointment_details , arguments: appointment);
                  //   },
                  //   child: Text(S.of(context).details),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
