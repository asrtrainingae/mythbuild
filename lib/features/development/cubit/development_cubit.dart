import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myth/features/development/data/model/development.dart';
import 'package:myth/features/development/data/model/development_repo.dart';
import 'package:myth/services/dependency_injector.dart';

part 'development_state.dart';
part 'development_cubit.freezed.dart';

class DevelopmentCubit extends Cubit<DevelopmentState> {
  DevelopmentCubit() : super(DevelopmentState.initial());

  Future<void> fetchDevelopments() async {
    emit(DevelopmentState.loading());
    try {
      // Simulate fetching data from an API or database
      // await Future.delayed(Duration(seconds: 2));

      final data = [
        {
            "name": "Test",
            "completed": "True",
            "startDate": "2024-05-27T07:30:00",
            "endDate": "2024-05-27T08:00:00",
            "clinicName": null,
            "therapistName": null,
            "completedGoals": null,
            "longGoalsRang": null,
            "visitTreatment": null,
            "video": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
        }
    ];

     var developments = (data as List)
    .map((d) => Development.fromJson(d as Map<String, dynamic>))
    .toList();
      emit(DevelopmentState.success(developments));
      
    return ;
      final res = await sl<DevelopmentRepo>().getData();
      res.fold((ifLeft){
 emit(DevelopmentState.failure(ifLeft));
      }, (data){
        print("DATA IZ $data");
      var developments = (data as List)
    .map((d) => Development.fromJson(d as Map<String, dynamic>))
    .toList();
      emit(DevelopmentState.success(developments));
      });
      

    } catch (error) {
      emit(DevelopmentState.failure(error.toString()));
    }
  }
}
