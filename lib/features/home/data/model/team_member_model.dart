import '../../domain/entity/team_member_entity.dart';

class TeamMemberModel extends TeamMemberEntity {
  const TeamMemberModel({
    required String name,
    required String role,
    required String imageUrl,
  }) : super(name: name, role: role, imageUrl: imageUrl);

  factory TeamMemberModel.fromJson(Map<String, dynamic> json) {
    return TeamMemberModel(
      name: json["name"],
      role: json["role"],
      imageUrl: json["imageUrl"],
    );
  }
}
