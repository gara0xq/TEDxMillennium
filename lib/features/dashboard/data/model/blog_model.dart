import '../../domain/entity/blog_entity.dart';

class BlogModel extends BlogEntity {
  BlogModel({
    required String content,
    required String author,
    required String imageUrl,
    required String slogan,
  }) : super(
         content: content,
         author: author,
         imageUrl: imageUrl,
         slogan: slogan,
       );
  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      content: json['description'],
      author: json['name'],
      imageUrl: json['image_url'],
      slogan: json['slogan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': content,
      'name': author,
      'image_url': imageUrl,
      'slogan': slogan,
    };
  }
}
