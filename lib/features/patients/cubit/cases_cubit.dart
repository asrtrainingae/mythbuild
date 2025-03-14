import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myth/features/patients/data/case_model.dart';

part 'cases_state.dart';
part 'cases_cubit.freezed.dart';

class CasesCubit extends Cubit<CasesState> {
  CasesCubit() : super(CasesState.loading());
  getCases() async {
    emit(CasesState.loading());
    print("getting data........");
    await Future.delayed(Duration(seconds: 3));
    final  _case = Case.fromJson({
            "appointmentName": "No title",
            "date": "2024-05-17T09:30:00",
            "clinicName": "د. حسين",
            "therapistName": "العيادة1",
            "status": "Cancelled",
            "totalAppointments": 0,
            "cancelledAppointments": 0,
            "patientDetails": {
                "firstName": "patient6",
                "lastName": "patient6",
                "fixedDay": null,
                "preferredLanguage": "en-US"
            }
        });
        print("getting data success");
    
    emit(CasesState.error(error: "error"));
    // emit(CasesState.success(cases: [_case,_case,_case]));
  }
}
