import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/data/datasource/reecommendation_doctor_item_list_model.dart';
import 'package:docdoc/features/home/data/models/specialization_response_model/doctor.dart';
import 'package:docdoc/features/home/presentation/cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/cubit/home_state.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:docdoc/features/home/presentation/widgets/recommendation_doctor/search_and_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 300),
      () {
        if (query.isNotEmpty) {
          context.read<HomeCubit>().searchDoctor(query);
        } else {
          context.read<HomeCubit>().clearSearchResult();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Search"),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is SearchDoctorFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
                backgroundColor: AppColors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchAndFilterBar(
                  onTap: () {
                    openModalSheet(context);
                  },
                  onChanged: _onSearchChanged,
                ),
                const SizedBox(height: 33),
                Text(
                  "Search results",
                  style: AppStyles.style18W600.copyWith(
                    color: const Color(0xff151515),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: state is SearchDoctorLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        )
                      : state is SearchDoctorSuccessState &&
                              state.doctors.isNotEmpty
                          ? _buildDoctorList(state.doctors)
                          : const Center(
                              child: Text("No results"),
                            ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDoctorList(List<Doctor> doctors) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          doctors.length,
          (index) {
            var doctor = doctors[index];
            return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(12),
                      child: Image.asset(
                        reecommendationDoctorList[index].image,
                        fit: BoxFit.cover,
                        height: 110,
                        width: 110,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name!,
                            style: AppStyles.style16W700,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${doctor.specialization!.name} | ${doctor.degree}",
                            style: AppStyles.style12W500,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.ratingStart,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                reecommendationDoctorList[index].rateAndReviews,
                                style: AppStyles.style12W500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
