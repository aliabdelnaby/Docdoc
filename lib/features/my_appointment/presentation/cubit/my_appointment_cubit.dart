import 'dart:convert';
import 'package:docdoc/core/constants/constants.dart';
import 'package:docdoc/core/database/api/end_points.dart';
import 'package:docdoc/features/my_appointment/data/models/my_appointment_model/my_appointment_model.dart';
import 'package:docdoc/features/my_appointment/presentation/cubit/my_appointment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MyAppointmentCubit extends Cubit<MyAppointmentState> {
  MyAppointmentCubit() : super(MyAppointmentInitial());

  List<MyAppointmentModel> myAppointmentModel = [];

  void fetchMyAppointment() async {
    try {
      emit(GetMyAppointmentLoading());

      var response = await http.get(
        Uri.parse(EndPoints.baserUrl + EndPoints.myAppointment),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      var responseData = jsonDecode(response.body);
      if (response.statusCode == 200 || responseData[ApiKeys.status] == true) {
        for (var item in responseData[ApiKeys.data]) {
          myAppointmentModel.add(MyAppointmentModel.fromJson(item));
        }
        emit(GetMyAppointmentSuccess());
      } else {
        emit(
            GetMyAppointmentFailure(errMessage: responseData[ApiKeys.message]));
      }
    } catch (e) {
      emit(GetMyAppointmentFailure(errMessage: e.toString()));
    }
  }
}
