import 'package:flutter/material.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/text_styles.dart';
import 'package:myth/widgets/app_bars.dart';

import '../../../app_router/app_router.dart';

class AppointmentsByDayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(title: 'Appointments', context:context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S.of(context).monday,
                style: secondary18Bold
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                appointmentCard('4-Jul', '2:30 - 3:00 PM', 'Ahmed Jabber', AppColors.primary , context),
                appointmentCard('4-Jul', '3:00 - 3:30 PM', 'Rami Saied', AppColors.primary , context),
                appointmentCard('4-Jul', '3:30 - 4:00 PM', 'Farah Awoamah', AppColors.primary , context),
                appointmentCard('4-Jul', '4:00 - 4:30 PM', 'Sami Jamal', AppColors.red_color , context),
                appointmentCard('4-Jul', '4:30 - 5:00 PM', 'Fatieh Joubran', AppColors.yellow_color , context),
                appointmentCard('4-Jul', '5:00 - 5:30 PM', 'Manal Omari', AppColors.primary , context),
                appointmentCard('4-Jul', '5:30 - 6:00 PM', 'Mona Amri', AppColors.primary , context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appointmentCard(String date, String time, String name, Color color , BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                      Navigator.of(context).pushNamed(Routes.appointment_details);
                    },
                    child: Text('Details'),
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