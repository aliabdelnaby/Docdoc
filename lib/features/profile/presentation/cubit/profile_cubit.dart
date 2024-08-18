import 'dart:convert';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/services/service_locator.dart';
import '../../data/models/profile_model/profile_model.dart';
import 'profile_state.dart';
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

  void logout() async {
    emit(LogoutLoadingState());
    var response = await http.post(
      Uri.parse(EndPoints.baserUrl + EndPoints.logout),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    var responseData = jsonDecode(response.body);
    if (response.statusCode == 200 || responseData[ApiKeys.status] == true) {
      await getIt<CacheHelper>().removeData(key: 'token');
      emit(LogoutSuccessState());
    } else {
      emit(LogoutFailureState(
          errMessage: responseData[ApiKeys.message].toString()));
    }
  }
}
