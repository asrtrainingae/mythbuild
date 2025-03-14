import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/features/appointments/bloc/appointment_bloc.dart';
import 'package:myth/features/appointments/data/models/appointment.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/text_styles.dart';
import 'package:myth/widgets/app_bars.dart';
import 'package:myth/widgets/error_and_loading.dart';

class DailyAppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(title: S.of(context).appointments, context: context),
      body: BlocBuilder<AppointmentBloc, AppointmentState>(
        builder: (context, state) {
          return state.when(
          loading: ()=>Loading(), 
          success: (canceledAppoin,appointments){
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).previous_appointments,
                        style: secondary18Bold),
                        SizedBox()
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.of(context).pushNamed(Routes.sessions);
                    //   },
                    //   child: Text(S.of(context).view_summary,
                    //       style: TextStyle(
                    //           color: AppColors.secondary,
                    //           fontSize: 16,
                    //           decoration: TextDecoration.underline)),
                    // )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ...appointments.map((e) => appointmentCard(
                      appointment: e,context: context
                    )).toList(),
                    // appointmentCard('4-Jul', '2:30 - 3:00 PM', 'Ahmed Jabber',
                    //     AppColors.primary, context),
                    // appointmentCard('4-Jul', '3:00 - 3:30 PM', 'Rams Saied',
                    //     AppColors.primary, context),
                    // appointmentCard('4-Jul', '3:30 - 4:00 PM', 'Farah Awoamah',
                    //     AppColors.primary, context),
                    // appointmentCard('4-Jul', '4:00 - 4:30 PM', 'Sami Jamal',
                    //     AppColors.red_color, context),
                    // appointmentCard('4-Jul', '4:30 - 5:00 PM', 'Fatieh Joubran',
                    //     AppColors.yellow_color, context),
                    // appointmentCard('4-Jul', '5:00 - 5:30 PM', 'Manal Omari',
                    //     AppColors.primary, context),
                    // appointmentCard('4-Jul', '5:30 - 6:00 PM', 'Mona Amri',
                    //     AppColors.primary, context),
                  ],
                ),
              ),
            ],
          );
          }
          , error: (error)=>ErrorWidget(error));
        },
      ),
    );
  }

  Widget appointmentCard({required Appointment appointment , required BuildContext context}) {
    final date = appointment.startDate!=null? DateFormat('d-MMM').format(appointment.startDate!):"---";
    final time = appointment.startDate!.hour.toString() + ':' + appointment.startDate!.minute.toString() + ' - ' + appointment.endDate!.hour.toString() + ':' + appointment.endDate!.minute.toString();
    final name = appointment.therapistName??"--";
    Color color =  appointment.status?.toLowerCase()=="completed" ? Colors.green: appointment.status?.toLowerCase()=="cancel" ? Colors.red:AppColors.primary;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                date,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      // onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(fixedAppointmentDetails(appointment) );
                    },
                    child: Text(S.of(context).details),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
