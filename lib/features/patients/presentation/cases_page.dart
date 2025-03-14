import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myth/features/patients/bloc/cases_bloc.dart';
import 'package:myth/features/patients/data/case_model.dart';
import 'package:myth/features/patients/presentation/widgets.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:myth/widgets/app_bars.dart';
import 'package:myth/widgets/custom_widgets.dart';
import 'package:myth/widgets/error_and_loading.dart';

class PatientsDetailsPage extends StatefulWidget {
  const PatientsDetailsPage({super.key});

  @override
  State<PatientsDetailsPage> createState() => _PatientsDetailsPageState();
}

class _PatientsDetailsPageState extends State<PatientsDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("GET STARTTTTTTTTTTTTTTTTED BLCOCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC");
    // BlocProvider.of<CasesBloc>(context).add(CasesEvent.started());
  }
  final caseJSON = { "fullName": "Patient1", "totalAppointments": 14, "cancelledAppointments": 13, "appointments": [ { "date": "2024-09-20T07:00:00", "status": "Cancelled" }, { "date": "2024-11-29T12:00:00", "status": "Cancelled" }, { "date": "2024-11-28T22:00:00", "status": "Cancelled" }, { "date": "2024-11-28T23:30:00", "status": "Cancelled" }, { "date": "2024-12-03T21:30:00", "status": "Cancelled" }, { "date": "2024-12-04T15:30:00", "status": "Cancelled" }, { "date": "2024-12-10T07:30:00", "status": "Cancelled" }, { "date": "2024-12-10T08:00:00", "status": "Cancelled" }, { "date": "2024-12-10T11:00:00", "status": "Cancelled" }, { "date": "2024-12-10T12:00:00", "status": "Cancelled" }, { "date": "2024-12-10T13:00:00", "status": "Cancelled" }, { "date": "2024-12-11T11:00:00", "status": "Cancelled" }, { "date": "2024-12-11T06:30:00", "status": "Cancelled" }, { "date": "2024-12-18T06:00:00", "status": "Active" } ] };
  
  @override
  Widget build(BuildContext context) {
    final testCase = Case.fromJson(caseJSON);
    final cases = [testCase,testCase,testCase];
    return Scaffold(
      appBar:
          myAppBar(title: "Casess", context: context, showBackButton: false),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     Navigator.of(context).pushNamed(Routes.add_patient);
      //   }, child: const Icon(Icons.add),),
      body: BlocBuilder<CasesBloc, CasesState>(
        builder: (context, state) {
          return state.when(
            loading: (){
              return Loading();
              // return buildCases(cases);
          //   return  ElevatedButton(
          //   onPressed: (){
          //     BlocProvider.of<CasesBloc>(context).add(CasesEvent.started());
          //   },
          //   child: const Text("load data"),
          // );
            },
             
          success: (success){
            print("SUCCESS ${success.length}");
            // return  ElevatedButton(
            //   onPressed: (){
            //     BlocProvider.of<CasesBloc>(context).add(CasesEvent.started());
            //   },
            //   child: const Text("load data"),
            // );
            return SingleChildScrollView(
            child: Column(
              children: [
                // searchBox(context: context),
                // Row(
                //   children: [
                //     Expanded(
                //         child: buildTimeSelectButton(text: "From 29/12/2023")),
                //     Expanded(
                //         child: buildTimeSelectButton(text: "To 29/04/2024")),
                //   ],
                // ),
                // SizedBox(height: 10),
                Divider(color: const Color.fromARGB(255, 212, 212, 212)),
                SizedBox(height: 10),
                buildCases(success),
              ],
            ),
          );
          }, error: (error)=>ShowError(errorMessage: error));
          
        },
      ),
    );
  }
  Widget buildCases(List<Case> cases){
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(bottom: 10),
      physics: NeverScrollableScrollPhysics(),
      itemCount: cases.length,
      itemBuilder: (BuildContext context, int index) { 
        final _case =cases[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: buildCaseCard(
            userCase: _case,context: context),
        );
      },
      
    );
  }
  Widget buildTimeSelectButton({required String text}) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
            color: AppColors.primary, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: ListTile(
                leading: Icon(Icons.calendar_month, color: Colors.white),
                title: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: white_14_bold,
                ))));
  }
}
