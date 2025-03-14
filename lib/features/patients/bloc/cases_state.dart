part of 'cases_bloc.dart';

@freezed
class CasesState with _$CasesState {
  const factory CasesState.loading() = _Loading;
  const factory CasesState.success({required List<Case> cases}) = _Success;
  const factory CasesState.error({required String error}) = _Error;
}
