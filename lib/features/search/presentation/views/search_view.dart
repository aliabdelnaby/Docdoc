import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../home/presentation/cubit/home_state.dart';
import '../../../home/presentation/widgets/notification/notifaction_app_bar.dart';
import '../../../home/presentation/widgets/recommendation_doctor/search_and_filter_bar.dart';
import '../widgets/search_item.dart';
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
                          ? SearchItem(doctors: state.doctors)
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
}
