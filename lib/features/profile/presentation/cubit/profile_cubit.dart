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

  Future<void> updateProfile() async {
    try {
      emit(UpdateProfileLoadingState());
      var response = await http.post(
        Uri.parse(EndPoints.baserUrl + EndPoints.updateProfile),
        body: {
          if (name != null) ApiKeys.name: name,
          if (email != null) ApiKeys.email: email,
          if (phone != null) ApiKeys.phone: phone,
          ApiKeys.gender: '0',
          if (password != null) ApiKeys.password: password,
          if (confirmPassword != null) ApiKeys.confirmPassword: confirmPassword,
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
void _handleUpdateUserErrors(Map<String, dynamic> responseData) {
  if (responseData[ApiKeys.data] != null && responseData[ApiKeys.data] is Map<String, dynamic>) {
    var errorMessage = responseData[ApiKeys.data] as Map<String, dynamic>;
    List<String> errorMessages = [];
    void addError(String key) {
      if (errorMessage.containsKey(key) && 
          errorMessage[key] is List && 
          errorMessage[key].isNotEmpty && 
          errorMessage[key][0] is String) {
        errorMessages.add(errorMessage[key][0]);
      }
    }
    addError(ApiKeys.name);
    addError(ApiKeys.email);
    addError(ApiKeys.password);
    addError(ApiKeys.gender);
    addError(ApiKeys.confirmPassword);
    addError(ApiKeys.phone);
    
    if (errorMessages.isNotEmpty) {
      emit(UpdateProfileFailureState(errMessage: errorMessages.join(', ')));
    } else {
      emit(UpdateProfileFailureState(errMessage: 'Unknown error occurred.'));
    }
  } else if (responseData[ApiKeys.data] != null) {
    emit(UpdateProfileFailureState(errMessage: responseData[ApiKeys.data].toString()));
  } else {
    emit(UpdateProfileFailureState(errMessage: 'Unknown error occurred.'));
  }
}
}
