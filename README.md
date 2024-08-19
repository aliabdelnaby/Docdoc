

# Dodoc - Telemedicine Application

Dodoc is a telemedicine platform that allows users to book appointments for virtual consultations or in-person visits at a clinic.

This project leverages various Flutter packages to manage state, handle API data, and provide a seamless user experience.

https://github.com/user-attachments/assets/dd33932d-1b5f-43b1-a65b-52b30a39bf6b

## Features

- **Appointment Booking**: Users can book appointments online for virtual consultations or schedule visits at a clinic.
- **Search for Doctors**: Users can search for specific doctors based on their needs.
- **Appointment Management**: View, reschedule, or cancel appointments easily. Completed and canceled appointments are displayed on separate pages for better organization.
- **Specialization Categories**: Users can select doctors from different specialization categories to find the right healthcare provider.
- **User Profile Management**: Users have full control over their profile, with the ability to update personal data like name, contact information, and more.
- **Secure and Private**: All consultations are secure, protecting patient privacy.
- **Doctor-Patient Chat**: Real-time chat allows patients and doctors to communicate before or after consultations.
- **Seamless User Experience**: User-friendly interface for easy navigation and appointment management.

## Packages Used

- **[go_router](https://pub.dev/packages/go_router)** - v14.2.3  
  Declarative routing and navigation within the app.
- **[flutter_svg](https://pub.dev/packages/flutter_svg)** - v2.0.10+1  
  Use of SVG images throughout the app.
- **[flutter_bloc](https://pub.dev/packages/flutter_bloc)** - v8.1.6  
  Efficient state management with Bloc and Cubit patterns.
- **[get_it](https://pub.dev/packages/get_it)** - v7.7.0  
  Dependency injection with the GetIt service locator.
- **[shared_preferences](https://pub.dev/packages/shared_preferences)** - v2.3.1  
  Persistent data storage for user settings and preferences.
- **[http](https://pub.dev/packages/http)** - v1.2.2  
  Manages HTTP requests to communicate with the API.
- **[easy_date_timeline](https://pub.dev/packages/easy_date_timeline)** - v1.1.3  
  Customizable date timeline for easy appointment selection.
- **[flutter_datetime_picker_plus](https://pub.dev/packages/flutter_datetime_picker_plus)** - v2.2.0  
  Intuitive date and time picker for scheduling appointments.
- **[chat_bubbles](https://pub.dev/packages/chat_bubbles)** - v1.6.0  
  Provides chat UI for doctor-patient conversations.

## State Management and API Integration
* State Management: The flutter_bloc package ensures effective state management, allowing the app to gracefully handle data from APIs, including loading, success, and error states.
* API Integration: The application leverages the http package to interact with a backend API, retrieving real-time data for doctor profiles, appointments, chat messages, and user information.


By combining robust functionality with a user-centric design, Dodoc empowers users to take control of their healthcare journey, fostering a more accessible and efficient experience for both patients and providers.




