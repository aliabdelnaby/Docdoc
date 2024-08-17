class PatientModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  PatientModel({this.id, this.name, this.email, this.phone, this.gender});

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        gender: json['gender'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'gender': gender,
      };
}
