import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myth/features/patients/data/case_model.dart';
import 'package:myth/services/dependency_injector.dart';
import 'package:myth/services/network/api_service.dart';
import 'package:myth/services/network/models/error_response.dart';
import 'package:myth/utils/server/end_points.dart';

part 'cases_event.dart';
part 'cases_state.dart';
part 'cases_bloc.freezed.dart';

class CasesBloc extends Bloc<CasesEvent, CasesState> {
  final apiService = sl<ApiService>();
  CasesBloc() : super(CasesState.loading()) {
    on<CasesEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(CasesState.loading());
          final Either<String, List<Case>> res = await getCases();
          print("RES izzz ${res}");
          res.fold(
            (error) => emit(CasesState.error(error: error)),
            (cases) {
              print("RIGHT ${cases.first.fullName}");
              emit(CasesState.success(cases: cases));
            },
          );
        },
      );
    });
  }

  Future<Either<String, List<Case>>> getCases() async {
    final res = await apiService.get(EndPoints.getDoctorCases);
      

    if(res is ErrorResponse){
      return left(res.message??"");
    }else{
    
    // await Future.delayed(const Duration(seconds: 3));
    // final _case = Case.fromJson({
    //   "appointmentId": "86e55463-e4c8-49f6-9bc2-08dc768e9323",
    //   "startDate": "2024-05-17T09:30:00",
    //   "endDate": "2024-05-17T10:00:00",
    //   "clinicName": "د. حسين",
    //   "therapistName": "العيادة1",
    //   "fixedDay": null,
    //   "status": "Completed",
    //   "patientDetails": {
    //     "firstName": "patient6",
    //     "fixedDay": null,
    //     "preferredLanguage": "en-US"
    //   },
    //   "appointmentDetails": [
    //     {
    //       "name": "No title",
    //       "startDate": "2024-05-17T09:30:00",
    //       "endDate": "2024-05-17T10:00:00"
    //     }
    //   ]
    // });
    return right(res["data"]["patients"].map<Case>((r)=>Case.fromJson(r)).toList()); 
    // return right([_case, _case]);
    }
  }
}