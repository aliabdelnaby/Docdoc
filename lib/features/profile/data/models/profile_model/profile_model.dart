class ProfileModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  ProfileModel({this.id, this.name, this.email, this.phone, this.gender});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
