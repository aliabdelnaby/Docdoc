import '../../../../core/utils/app_colors.dart';
import '../cubit/my_appointment_cubit.dart';
import '../cubit/my_appointment_state.dart';
import 'upcoming_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpComingPage extends StatelessWidget {
  const UpComingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyAppointmentCubit, MyAppointmentState>(
      builder: (context, state) {
        MyAppointmentCubit cubit = BlocProvider.of<MyAppointmentCubit>(context);
        return state is GetMyAppointmentLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    cubit.myAppointmentModel.length,
                    (index) {
                      var item =
                          cubit.myAppointmentModel.reversed.toList()[index];
                      var i = index;
                      return MyAppointmentUpComingItem(
                        item: item,
                        index: i,
                      );
                    },
                  ),
                ),
              );
      },
    );
  }
}
