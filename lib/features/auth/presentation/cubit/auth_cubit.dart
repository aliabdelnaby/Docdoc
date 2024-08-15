import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/services/service_locator.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  bool? obscurePasswordTextValue = true;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;
  int? gender;

  //! Register function
  Future<void> register() async {
    try {
      emit(SignUpLoadingState());
      var response = await http.post(
        Uri.parse(EndPoints.baserUrl + EndPoints.register),
        body: {
          ApiKeys.name: name,
          ApiKeys.email: email,
          ApiKeys.phone: phone,
          ApiKeys.gender: '0',
          ApiKeys.password: password,
          ApiKeys.confirmPassword: confirmPassword,
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200 || responseData[ApiKeys.status] == true) {
        //* Success
        emit(SignUpSuccessState());
      } else {
        //* Check for specific errors in the response
        _handleSignUpErrors(responseData);
      }
    } catch (e) {
      emit(SignUpFailureState(errMessage: e.toString()));
    }
  }

  //! Handle Register errors in the response
  void _handleSignUpErrors(responseData) {
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
        emit(SignUpFailureState(errMessage: errorMessages.join(', ')));
      } else {
        emit(SignUpFailureState(errMessage: errorMessage.toString()));
      }
    } else {
      emit(SignUpFailureState(errMessage: 'Unknown error occurred.'));
    }
  }

  //! Login function
  Future<void> login() async {
    try {
      emit(LoginLoadingState());
      var response = await http.post(
        Uri.parse(EndPoints.baserUrl + EndPoints.login),
        body: {
          ApiKeys.email: email,
          ApiKeys.password: password,
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200 || responseData[ApiKeys.status] == true) {
        await getIt<CacheHelper>().saveData(
          key: ApiKeys.token,
          value: responseData[ApiKeys.data][ApiKeys.token],
        );
        token = responseData[ApiKeys.data][ApiKeys.token];
        emit(LoginSuccessState());
      } else {
        emit(LoginFailureState(
            errMessage: responseData[ApiKeys.message].toString()));
      }
    } catch (e) {
      emit(LoginFailureState(errMessage: e.toString()));
    }
  }

  //! Obscure password text
  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }
}
