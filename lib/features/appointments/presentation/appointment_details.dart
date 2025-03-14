import 'package:flutter/material.dart';
import 'package:myth/features/appointments/data/models/appointment.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/widgets/app_bars.dart';

class AppointmentDetails extends StatelessWidget {
  Appointment appointment;
  AppointmentDetails({required this.appointment});
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar:myAppBar(title: S.of(context).appointment_details, context:context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/reviews/user3.jpg'), // Replace with actual image
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.therapistName??"----",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(appointment.status?? "----"),
                  ],
                ),
              ],
            ),
            Divider(height: 32, thickness: 1),
            Text(
              S.of(context).personal_information,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            infoCard('${S.of(context).name}: ${appointment.therapistName??"----"}'),
            // infoCard('${S.of(context).case_number}: ${appointment.}'),
            // infoCard('${S.of(context).mobile_number}: +971********'),
            infoCard('${S.of(context).centre_name}: ${appointment.clinicName}'),
            SizedBox(height: 16),
            Text(
              '${S.of(context).diagnosis}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "${S.of(context).diagnosis_text}",
                // 'Many children with Childhood Apraxia of speech face difficulty moving the jaw, lips and tongue to the correct positions...',
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 16),
            TabBarSection(),
            SizedBox(height: 16),
            
          ],
        ),
      ),
    );
  }

  Widget infoCard(String text) {
    return Container(
      width:double.infinity,
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text),
    );
  }
}

class TabBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: S.of(context).short_goals_range),
              Tab(text: S.of(context).long_goals_range),
              Tab(text: S.of(context).treatment_plan),
            ],
          ),
          Container(
            height: 500,
            child: TabBarView(
               physics: NeverScrollableScrollPhysics(),
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    goalCard(S.of(context).goal_1),
                    goalCard(S.of(context).goal_2),
                    goalCard(S.of(context).goal_3),
                    goalCard(S.of(context).goal_4),
                    goalCard(S.of(context).other),
                    Text(
              S.of(context).video,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage('assets/images/background_image/vid.png'), // Replace with actual video thumbnail
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.play_circle_filled,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            )
                  ],
                ),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                   goalCard(S.of(context).goal_1),
                    goalCard(S.of(context).goal_2),
                    goalCard(S.of(context).goal_3),
                    goalCard(S.of(context).goal_4),
                    goalCard(S.of(context).other)]),
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    goalCard(S.of(context).goal_1),
                    goalCard(S.of(context).goal_2),
                    goalCard(S.of(context).goal_3),
                    goalCard(S.of(context).goal_4),
                    goalCard(S.of(context).other),]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget goalCard(String goal) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(goal),
    );
  }
}