import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myth/features/auth/bloc/auth_bloc.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:myth/widgets/app_bars.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(
            title: S.of(context).appointments,
            context: context,
            showBackButton: false),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state is UserLoggedIn?
            SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: 
                  state.user.isDoctor==true? DoctorColumn(context):
                  PatientColumn(context)
                  ,
                ))
                :ErrorWidget("something wring");
          },
        ));
  }
}

Widget DoctorColumn(context){
  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RoundedButtonAppointment(
                          text: S.of(context).daily_appointments,
                          image: Assets.bill,
                          context: context,
                          is_daily: true),
                      RoundedButtonAppointment(
                          text: S.of(context).fixed_appointments,
                          image: Assets.calendar,
                          context: context,
                          is_daily: false),
                    ],
                  );
}

Widget PatientColumn(context){
  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RoundedButtonAppointment(
                          text: S.of(context).previous_appointments,
                          image: Assets.bill,
                          context: context,
                          is_daily: true),
                      RoundedButtonAppointment(
                          text: S.of(context).fixed_appointments,
                          image: Assets.calendar,
                          context: context,
                          is_daily: false),
                    ],
                  );
}
Widget RoundedButtonAppointment(
    {required String image,
    required String text,
    required BuildContext context,
    required bool is_daily}) {
  double size = 300;
  return InkWell(
    onTap: () {
      if (is_daily)
        Navigator.of(context).pushNamed(Routes.daily_appointments);
      else
        Navigator.of(context).pushNamed(Routes.appointment_fixed);
    },
    child: Container(
      width: size, height: size,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.rounded_button_appointment))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                text.replaceFirst(" ", "\n"),
                textAlign: TextAlign.center,
                style: primary_18_bold,
              ),
            ),
          ],
        ),
      ),
      // color: Colors.redAccent,
    ),
  );
}
