import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:docdoc/features/home/presentation/widgets/book_appointment/step_indicator.dart';
import 'package:flutter/material.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView({super.key});

  @override
  State<BookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                children: const [
                  DateAndTimePage(),
                  PaymentPage(),
                  SummaryPage(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              if (_currentIndex < 2) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                //! Perform the final booking action
              }
            },
            child: Text(_currentIndex < 2 ? 'Continue' : 'Book Now'),
          ),
        ),
      ),
    );
  }
}

class DateAndTimePage extends StatelessWidget {
  const DateAndTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Date', style: TextStyle(fontSize: 18)),
          // Implement a Date Picker or Calendar here
          SizedBox(height: 16),
          Text('Available Time', style: TextStyle(fontSize: 18)),
          // Implement Time Slots here (e.g., 08:30 AM, 09:00 AM, etc.)
          SizedBox(height: 16),
          Text('Appointment Type', style: TextStyle(fontSize: 18)),
          // Implement radio buttons for In-Person, Video Call, Phone Call
        ],
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Payment Option', style: TextStyle(fontSize: 18)),
          ListTile(
            title: const Text('Credit Card'),
            leading: Radio(
                value: 'credit_card',
                groupValue: 'payment',
                onChanged: (value) {}),
          ),
          ListTile(
            title: const Text('Paypal'),
            leading: Radio(
                value: 'paypal', groupValue: 'payment', onChanged: (value) {}),
          ),
          // Add more payment options here
        ],
      ),
    );
  }
}

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Booking Information', style: TextStyle(fontSize: 18)),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Wednesday, 08 May 2023'),
            subtitle: Text('08:30 AM'),
          ),
          ListTile(
            leading: Icon(Icons.accessibility),
            title: Text('In Person'),
          ),
          Divider(),
          Text('Doctor Information', style: TextStyle(fontSize: 18)),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            title: Text('Dr. Randy Wigham'),
            subtitle: Text('General | RSUD Gatot Subroto'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text('4.8 (4,279 reviews)'),
              ],
            ),
          ),
          Divider(),
          Text('Payment Information', style: TextStyle(fontSize: 18)),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Paypal'),
            subtitle: Text('**** 37842'),
          ),
          Divider(),
          Text('Payment Info', style: TextStyle(fontSize: 18)),
          ListTile(
            title: Text('Subtotal'),
            trailing: Text('\$4694'),
          ),
          ListTile(
            title: Text('Tax'),
            trailing: Text('\$250'),
          ),
          ListTile(
            title: Text('Payment Total'),
            trailing: Text('\$4944'),
          ),
        ],
      ),
    );
  }
}
