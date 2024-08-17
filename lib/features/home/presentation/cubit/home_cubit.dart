import 'dart:convert';
import 'package:docdoc/features/home/data/models/specialization_response_model/doctor.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/database/api/end_points.dart';
import '../../data/models/specialization_response_model/specialization_response_model.dart';
import 'home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  String? startTime;
  String? note;

  Future<void> getAllSpecialities() async {
    try {
      emit(GetAllSpecialitiesLoadingState());
      var response = await http.get(
        Uri.parse(
          EndPoints.baserUrl + EndPoints.specialization,
        ),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200 && responseData[ApiKeys.status] == true) {
        List<dynamic> data = responseData[ApiKeys.data];
        SpecializationResponseModel specializations =
            SpecializationResponseModel.fromJson(data);
        emit(GetAllSpecialitiesSuccessState(specializations: specializations));
      } else {
        emit(GetAllSpecialitiesFailureState(
            errMessage: responseData[ApiKeys.message].toString()));
      }
    } catch (e) {
      emit(GetAllSpecialitiesFailureState(errMessage: e.toString()));
    }
  }

  void makeAnAppointment({required String doctorId}) async {
    try {
      emit(MakeAnAppointmentLoadingState());
      var response = await http.post(
        Uri.parse(
          EndPoints.baserUrl + EndPoints.makeAppointment,
        ),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'doctor_id': doctorId,
          'start_time': startTime,
          'note': note,
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          responseData[ApiKeys.status] == true) {
        emit(MakeAnAppointmentSuccessState());
      } else {
        emit(MakeAnAppointmentFailureState(
            errMessage: responseData[ApiKeys.data].toString()));
      }
    } catch (e) {
      emit(MakeAnAppointmentFailureState(errMessage: e.toString()));
    }
  }

  void searchDoctor(String query) async {
    try {
      emit(SearchDoctorLoadingState());
      var resonse = await http.get(
        Uri.parse('${EndPoints.baserUrl}${EndPoints.searchDoctor}$query'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      var responseData = jsonDecode(resonse.body);
      if (resonse.statusCode == 200 || responseData[ApiKeys.status] == true) {
        List<dynamic> data = responseData[ApiKeys.data];
        List<Doctor> doctors = data.map((e) => Doctor.fromJson(e)).toList();
        emit(SearchDoctorSuccessState(doctors: doctors));
      } else {
        emit(SearchDoctorFailureState(
            errMessage: responseData[ApiKeys.message].toString()));
      }
    } catch (e) {
      emit(SearchDoctorFailureState(errMessage: e.toString()));
    }
  }

  void clearSearchResult() {
    emit(SearchDoctorSuccessState(doctors: []));
  }
}
