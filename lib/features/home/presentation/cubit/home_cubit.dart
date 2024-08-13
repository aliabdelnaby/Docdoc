import 'dart:convert';
import '../../../../core/constants/constants.dart';
import '../../../../core/database/api/end_points.dart';
import '../../data/models/specialization_response_model/specialization_response_model.dart';
import 'home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

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
}
