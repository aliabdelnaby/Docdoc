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
