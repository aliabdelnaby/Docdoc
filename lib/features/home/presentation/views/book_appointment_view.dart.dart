import 'package:docdoc/features/home/data/models/specialization_response_model/doctor.dart';

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
    return Scaffold(
      appBar: buildAppBar(context, title: "Book Appointment"),
      body: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 16),
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
                      });
                    },
                    onNoteChanged: (value) {
                      setState(() {
                        note = value;
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
      bottomNavigationBar: MakeAnAppointmentBtn(
        text: _currentIndex < 2 ? 'Continue' : 'Book Now',
        onPressed: () {
          if (_currentIndex < 2) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else {
            context.pushReplacement('/bookingDetailsView');
          }
        },
      ),
    );
  }
}
