part of 'cases_bloc.dart';

@freezed
class CasesEvent with _$CasesEvent {
  const factory CasesEvent.started() = _Started;
}