import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myth/features/appointments/bloc/appointment_bloc.dart';
// import 'package:myth/features/appointments/data/provider/medical_provider.dart';
import 'package:myth/features/appointments/data/models/clinic.dart';
import 'package:myth/features/appointments/presentation/widgets.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:myth/widgets/app_bars.dart';

import 'package:table_calendar/table_calendar.dart';

// import '../data/provider/appointment/appointment_provider.dart';
class UpcomingAppointmentsPage extends ConsumerStatefulWidget {
  @override
  _UpcomingAppointmentsPageState createState() => _UpcomingAppointmentsPageState();
}

class _UpcomingAppointmentsPageState extends ConsumerState<UpcomingAppointmentsPage>  {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  TextEditingController _description = TextEditingController();
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Clinic? _selected_clinic;
  String? _selected_clinic_id;

List<Map<String, String>> times = [];
// var times = ["09:00" , "12:00" , "13:00" , 
//     "16:00" , "17:20" , "18:00" , 
//     "18:20" , "20:00"  ];
String _selectedTime = "";

String formatTime(DateTime time) {
  int hour = time.hour;
  int minute = time.minute;
  // String period = hour >= 12 ? 'PM' : 'AM';
  // if (hour > 12) hour -= 12;
  // if (hour == 0) hour = 12;
  return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} ';//$period';
}

buildTimeData(){
  
  DateTime startTime = DateTime(0, 1, 1, 9, 0); // Start at 9:00 AM
  DateTime endTime = DateTime(0, 1, 1, 22, 0);  // End at 10:00 PM

  while (startTime.isBefore(endTime)) {
    DateTime nextTime = startTime.add(Duration(minutes: 30));
    String title = "${formatTime(startTime)} to ${formatTime(nextTime)}";
    String value = formatTime(startTime);
    times.add({"title": title, "value": value});
    startTime = nextTime;
  }

}
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<AppointmentBloc>(context).add(getA());
  }
  @override
  Widget build(BuildContext context) {
    buildTimeData();
    // final _appointmentsProvider = ref.watch(appointmentProvider);
    //  final clinics = ref.watch(clinicProvider);
    return Scaffold(
      appBar: myAppBar(title: S.of(context).appointments, context:context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Upcoming Appointments"  , style: title_16_bold),
            // _appointmentsProvider.loading?
            // Center(child:CircularProgressIndicator())
            // : SizedBox(height: 16.0),
            // Text(S.of(context).upcoming_appointments , style:black_16_bold) ,
            
            // if(_appointmentsProvider.loading==false)
            // ..._appointmentsProvider.appointments.map((appointment) => buildAppointmentCard(appointment:appointment , ref: ref, context:context)).toList()
          ],
        ),
      ),
    );
  }

}