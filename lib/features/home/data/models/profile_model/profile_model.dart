class ProfileModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
    );
  }

  static List<ProfileModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProfileModel.fromJson(json)).toList();
  }
}
