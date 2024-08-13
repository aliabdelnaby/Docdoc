import '../../data/models/profile_model/profile_model.dart';
import '../../data/models/specialization_response_model/specialization_response_model.dart';

class HomeState {}

final class HomeInitial extends HomeState {}

final class GetProfileLoadingState extends HomeState {}

final class GetProfileSuccessState extends HomeState {
  final ProfileModel profileModel;

  GetProfileSuccessState({required this.profileModel});
}

final class GetProfileFailureState extends HomeState {
  final String errMessage;

  GetProfileFailureState({required this.errMessage});
}

final class GetAllSpecialitiesLoadingState extends HomeState {}

final class GetAllSpecialitiesSuccessState extends HomeState {
  final SpecializationResponseModel specializations;

  GetAllSpecialitiesSuccessState({required this.specializations});
}

final class GetAllSpecialitiesFailureState extends HomeState {
  final String errMessage;

  GetAllSpecialitiesFailureState({required this.errMessage});
}
