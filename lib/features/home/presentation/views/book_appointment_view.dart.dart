import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/features/home/presentation/cubit/home_cubit.dart';
import 'package:docdoc/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/specialization_response_model/doctor.dart';
import 'doctor_details_view.dart';
import '../widgets/book_appointment/date_time_page.dart';
import '../widgets/book_appointment/payment_page.dart';
import '../widgets/book_appointment/summary_page.dart';
import '../widgets/notification/notifaction_app_bar.dart';
import '../widgets/book_appointment/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({super.key});

  @override
  State<BookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  DateTime? selectedDateTime;
  String? note;
  String? paymentMethod;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final extra = state.extra as Map<String, dynamic>?;
    final Doctor doctor = extra?['doctor'] ?? 'Unknown Details';
    final String image = extra?['image'] ?? 'Unknown Details';
    final String rating = extra?['rating'] ?? 'Unknown Details';
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is MakeAnAppointmentSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Appointment booked successfully'),
              backgroundColor: AppColors.primary,
              behavior: SnackBarBehavior.floating,
            ),
          );
          context.pushReplacement(
            '/bookingDetailsView',
            extra: {
              'selectedDateTime': selectedDateTime,
              'note': note,
              'doctor': doctor,
              'image': image,
              'rating': rating,
            },
          );
        } else if (state is MakeAnAppointmentFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage.toString()),
              backgroundColor: AppColors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar(context, title: "Book Appointment"),
          body: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 24, vertical: 16),
            child: Column(
              children: [
                StepIndicator(currentStep: _currentIndex),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    children: [
                      DateAndTimePage(
                        onDateTimeConfirm: (value) {
                          setState(() {
                            selectedDateTime = value;
                            cubit.startTime = value.toString();
                          });
                        },
                        onNoteChanged: (value) {
                          setState(() {
                            note = value;
                            cubit.note = value;
                          });
                        },
                      ),
                      PaymentPage(
                        onChanged: (value) {
                          setState(() {
                            paymentMethod = value;
                          });
                        },
                      ),
                      SummaryPage(
                        selectedDateTime: selectedDateTime,
                        note: note,
                        doctor: doctor,
                        image: image,
                        rating: rating,
                        paymentMethod: paymentMethod,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: state is MakeAnAppointmentLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                )
              : MakeAnAppointmentBtn(
                  text: _currentIndex < 2 ? 'Continue' : 'Book Now',
                  onPressed: () {
                    if (_currentIndex < 2) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      cubit.makeAnAppointment(
                        doctorId: doctor.id!.toString(),
                      );
                    }
                  },
                ),
        );
      },
    );
  }
}
