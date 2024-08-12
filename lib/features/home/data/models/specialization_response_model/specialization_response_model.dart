import 'doctor.dart';

class SpecializationResponseModel {
  final List<Specialization> specializations;

  SpecializationResponseModel({required this.specializations});

  factory SpecializationResponseModel.fromJson(List<dynamic> json) {
    return SpecializationResponseModel(
      specializations: json.map((e) => Specialization.fromJson(e)).toList(),
    );
  }
}

class Specialization {
  int? id;
  String? name;
  List<Doctor>? doctors;

  Specialization({this.id, this.name, this.doctors});

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'] as int?,
      name: json['name'] as String?,
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'doctors': doctors?.map((e) => e.toJson()).toList(),
      };
}
