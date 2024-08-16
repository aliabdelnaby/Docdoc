import 'package:go_router/go_router.dart';

import '../widgets/notification/notifaction_app_bar.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/datasource/doctor_speciality_item_list.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorSpecialityView extends StatelessWidget {
  const DoctorSpecialityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Doctor Speciality",
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state is GetAllSpecialitiesLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                )
              : state is GetAllSpecialitiesSuccessState
                  ? GridView.builder(
                      padding: const EdgeInsetsDirectional.only(
                        top: 42,
                        start: 30,
                        end: 30,
                        bottom: 20,
                      ),
                      itemCount: state.specializations.specializations.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 32,
                        crossAxisSpacing: 36,
                        childAspectRatio: 0.68,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.push(
                              '/doctorsSpeciality',
                              extra: {
                                'specialization': state
                                    .specializations.specializations[index],
                              
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                  minHeight: 80,
                                  minWidth: 80,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(100),
                                  color: AppColors.primary.withOpacity(0.05),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.all(20),
                                  child: Center(
                                    child: Image.asset(
                                      specialitylList.elementAt(index).image,
                                      height: 40,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Expanded(
                                child: Text(
                                  state.specializations.specializations[index]
                                      .name!,
                                  style: AppStyles.style12W400.copyWith(
                                    color: AppColors.black2,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : const SizedBox();
        },
      ),
    );
  }
}
