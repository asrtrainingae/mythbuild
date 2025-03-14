import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/features/patients/data/case_model.dart';
import 'package:myth/features/patients/presentation/widgets.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:myth/widgets/app_bars.dart';

class SessionsPage extends StatefulWidget {
  Case userCase;
  SessionsPage({required this.userCase,super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  late Case userCase ;
  late List<CaseAppointment> _canceldAppointments ;
  late List<CaseAppointment> _doneAppointments ;
  List<CaseAppointment> _shownAppointments = [] ;
  bool show_canceled_sessions = false;
  bool show_success_sessions = false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     userCase = widget.userCase;
    _canceldAppointments = userCase.appointments.where((app)=>app.status.toLowerCase()=="canceled").toList();
    _doneAppointments = userCase.appointments.where((app)=>app.status.toLowerCase()!="canceled").toList();
  }

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      appBar: myAppBar(title:S.of(context).sessions, context: context), 
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed(Routes.add_patient);
        }, child: const Icon(Icons.add),),
      body:  SingleChildScrollView(
        child: Column(
          children:[
            // searchBox(context:context),
            // Row(
            //   children: [
            //     Expanded(child: buildTimeSelectButton(text: "From 29/12/2023")),
            //     Expanded(child: buildTimeSelectButton(text: "To 29/04/2024")),
            //   ],
            // ),
            // SizedBox(height:10) ,
            // Divider(color:const Color.fromARGB(255, 212, 212, 212)),
            SizedBox(height:10) ,

            buildTotalCard(total:"${userCase.totalAppointments}" , title:"Total number of all  done Sessions" , 
            color:show_canceled_sessions==true?green_color.withOpacity(.5) :green_color , 
            pressed:(){
              
              setState((){
                {
                show_success_sessions = true;
                show_canceled_sessions = false;
                _shownAppointments = show_canceled_sessions==true?_canceldAppointments :_doneAppointments;
              }
              });
            }),
            const SizedBox(height: 20),
            buildTotalCard(total:"${userCase.cancelledAppointments}", title:"Total number of all  canceled Sessions" , color:show_success_sessions==true?red_color.withOpacity(.5): red_color , 
             pressed:(){
              setState((){
                {
                show_success_sessions = false;
                show_canceled_sessions = true;
              _shownAppointments = show_canceled_sessions==true?_canceldAppointments :_doneAppointments;
              print("canceled appointments are ${_canceldAppointments.length}");
              }

              });
            }),
            SizedBox(height:10) ,
            Divider(color:const Color.fromARGB(255, 212, 212, 212)),
            if(show_canceled_sessions|| show_success_sessions)
            ListView.builder(
              shrinkWrap: true,
              itemCount: _shownAppointments.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx , index){
                final currentAppointment = _shownAppointments[index];
                return Container(
                padding:EdgeInsets.all(16),
                margin:EdgeInsets.symmetric(vertical:6 , horizontal:16),
                width:double.infinity,
                decoration: BoxDecoration(
                  color: show_success_sessions==true?green_color:red_color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("session ${index+1}", style:white_16_bold),
                    Text(DateFormat('yyyy-MM-dd').format(currentAppointment.date), style:white_16_bold)
                  ],
                ),
              );
              }
              
              )
          ],
        ),
      ),
    );
  }

  Widget buildTimeSelectButton({required String text}){
    return Container(
      margin:EdgeInsets.all(10) ,
      padding:EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color:AppColors.primary,
        borderRadius:BorderRadius.circular(10)
      ),
      child:Center(child:ListTile(leading: Icon(Icons.calendar_month , color:Colors.white),title:Text(text , textAlign: TextAlign.center,style: white_14_bold,)))
    );
  }
}