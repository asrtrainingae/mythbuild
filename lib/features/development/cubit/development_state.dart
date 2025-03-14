part of 'development_cubit.dart';

@freezed
class DevelopmentState with _$DevelopmentState {
  const factory DevelopmentState.initial() = _Initial;
  const factory DevelopmentState.loading() = _Loading;
  const factory DevelopmentState.success(List<Development> developments) = _Success;
  const factory DevelopmentState.failure(String error) = _Failure;
}
