import 'dart:convert';
import 'package:flutter/material.dart';
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
  GlobalKey<FormState> updateProfileKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? phone;
  int? gender;
  String? password;
  String? confirmPassword;

  Future<void> fetchUserProfile() async {
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

  Future<void> updateProfile() async {
    try {
      emit(UpdateProfileLoadingState());
      var response = await http.post(
        Uri.parse(EndPoints.baserUrl + EndPoints.updateProfile),
        body: {
          ApiKeys.name: name,
          ApiKeys.email: email,
          ApiKeys.phone: phone,
          ApiKeys.gender: '0',
          ApiKeys.password: password,
          ApiKeys.confirmPassword: confirmPassword,
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200 || responseData[ApiKeys.status] == true) {
        print(responseData);
        emit(UpdateProfileSuccessState());
      } else {
        _handleUpdateUserErrors(responseData);
        print(responseData);
      }
    } catch (e) {
      emit(UpdateProfileFailureState(errMessage: e.toString()));
      print(e);
    }
  }

  void _handleUpdateUserErrors(responseData) {
    if (responseData[ApiKeys.data] != null) {
      var errorMessage = responseData[ApiKeys.data];
      if (errorMessage is Map<String, dynamic>) {
        List<String> errorMessages = [];
        if (errorMessage.containsKey(ApiKeys.name)) {
          errorMessages.add(errorMessage[ApiKeys.name][0]);
        }
        if (errorMessage.containsKey(ApiKeys.email)) {
          errorMessages.add(errorMessage[ApiKeys.email][0]);
        }
        if (errorMessage.containsKey(ApiKeys.password)) {
          errorMessages.add(errorMessage[ApiKeys.password][0]);
        }
        if (errorMessage.containsKey(ApiKeys.gender)) {
          errorMessages.add(errorMessage[ApiKeys.gender][0]);
        }
        if (errorMessage.containsKey(ApiKeys.confirmPassword)) {
          errorMessages.add(errorMessage[ApiKeys.confirmPassword][0]);
        }
        if (errorMessage.containsKey(ApiKeys.phone)) {
          errorMessages.add(errorMessage[ApiKeys.phone][0]);
        }
        emit(UpdateProfileFailureState(errMessage: errorMessages.join(', ')));
      } else {
        emit(UpdateProfileFailureState(errMessage: errorMessage.toString()));
      }
    } else {
      emit(UpdateProfileFailureState(errMessage: 'Unknown error occurred.'));
    }
  }
}
