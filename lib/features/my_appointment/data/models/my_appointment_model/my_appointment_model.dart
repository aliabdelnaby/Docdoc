import 'doctor.dart';
import 'patient.dart';

class MyAppointmentModel {
  int? id;
  MyAppointmenDoctor? doctor;
  PatientModel? patient;
  String? appointmentTime;
  String? appointmentEndTime;
  String? status;
  String? notes;
  int? appointmentPrice;

  MyAppointmentModel({
    this.id,
    this.doctor,
    this.patient,
    this.appointmentTime,
    this.appointmentEndTime,
    this.status,
    this.notes,
    this.appointmentPrice,
  });

  factory MyAppointmentModel.fromJson(Map<String, dynamic> json) {
    return MyAppointmentModel(
      id: json['id'] as int?,
      doctor: json['doctor'] == null
          ? null
          : MyAppointmenDoctor.fromJson(json['doctor'] as Map<String, dynamic>),
      patient: json['patient'] == null
          ? null
          : PatientModel.fromJson(json['patient'] as Map<String, dynamic>),
      appointmentTime: json['appointment_time'] as String?,
      appointmentEndTime: json['appointment_end_time'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      appointmentPrice: json['appointment_price'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'doctor': doctor?.toJson(),
        'patient': patient?.toJson(),
        'appointment_time': appointmentTime,
        'appointment_end_time': appointmentEndTime,
        'status': status,
        'notes': notes,
        'appointment_price': appointmentPrice,
      };
}
