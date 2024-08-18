import 'dart:convert';
import 'package:docdoc/core/constants/constants.dart';
import 'package:docdoc/core/database/api/end_points.dart';
import 'package:docdoc/features/profile/data/models/profile_model/profile_model.dart';
import 'package:docdoc/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ProfileModel? profileModel;
  Future<void> getProfile() async {
    try {
      emit(GetProfileLoadingState());
      var response = await http.get(
        Uri.parse(EndPoints.baserUrl + EndPoints.profile),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200 || responseData[ApiKeys.status] == true) {
        profileModel = ProfileModel.fromJson(responseData[ApiKeys.data][0]);
        emit(GetProfileSuccessState());
      } else {
        emit(GetProfileFailureState(
            errMessage: responseData[ApiKeys.message].toString()));
      }
    } catch (e) {
      emit(GetProfileFailureState(errMessage: e.toString()));
    }
  }
}
