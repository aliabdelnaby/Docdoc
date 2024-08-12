import 'package:docdoc/features/home/data/models/profile_model/profile_model.dart';

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
