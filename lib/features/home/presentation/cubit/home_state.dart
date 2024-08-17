import '../../data/models/specialization_response_model/doctor.dart';

import '../../data/models/specialization_response_model/specialization_response_model.dart';

class HomeState {}

final class HomeInitial extends HomeState {}

final class GetAllSpecialitiesLoadingState extends HomeState {}

final class GetAllSpecialitiesSuccessState extends HomeState {
  final SpecializationResponseModel specializations;

  GetAllSpecialitiesSuccessState({required this.specializations});
}

final class GetAllSpecialitiesFailureState extends HomeState {
  final String errMessage;

  GetAllSpecialitiesFailureState({required this.errMessage});
}

final class MakeAnAppointmentLoadingState extends HomeState {}

final class MakeAnAppointmentSuccessState extends HomeState {}

final class MakeAnAppointmentFailureState extends HomeState {
  final String errMessage;

  MakeAnAppointmentFailureState({required this.errMessage});
}

final class SearchDoctorLoadingState extends HomeState {}

final class SearchDoctorSuccessState extends HomeState {
  final List<Doctor> doctors;

  SearchDoctorSuccessState({required this.doctors});
}

final class SearchDoctorFailureState extends HomeState {
  final String errMessage;

  SearchDoctorFailureState({required this.errMessage});
}
