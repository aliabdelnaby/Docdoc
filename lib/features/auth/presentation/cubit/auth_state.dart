class AuthState {}

final class AuthInitial extends AuthState {}

final class ObscurePasswordTextUpdateState extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccessState extends AuthState {}

final class SignUpFailureState extends AuthState {
  final String errMessage;
  SignUpFailureState({required this.errMessage});
}
