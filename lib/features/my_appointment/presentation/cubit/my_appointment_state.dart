class MyAppointmentState {}

final class MyAppointmentInitial extends MyAppointmentState {}

final class GetMyAppointmentLoading extends MyAppointmentState {}

final class GetMyAppointmentSuccess extends MyAppointmentState {}

final class GetMyAppointmentFailure extends MyAppointmentState {
  final String errMessage;

  GetMyAppointmentFailure({required this.errMessage});
}
