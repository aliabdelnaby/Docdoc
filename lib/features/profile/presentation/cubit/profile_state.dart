class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileLoadingState extends ProfileState {}

final class GetProfileSuccessState extends ProfileState {}

final class GetProfileFailureState extends ProfileState {
  final String errMessage;

  GetProfileFailureState({required this.errMessage});
}

final class LogoutLoadingState extends ProfileState {}

final class LogoutSuccessState extends ProfileState {}

final class LogoutFailureState extends ProfileState {
  final String errMessage;

  LogoutFailureState({required this.errMessage});
}
