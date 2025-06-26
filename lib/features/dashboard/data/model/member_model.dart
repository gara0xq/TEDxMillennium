class MemberModel {
  final String name;
  final String role;

  MemberModel({required this.name, required this.role});

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(name: json['name'], role: json['role']);
  }

  Map<String, dynamic> toJson(String committeeName) {
    return {'name': name, 'role': role, 'committee': committeeName};
  }
}
