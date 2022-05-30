import '../../domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) : super(userId: userId, id: id, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["userId"] = userId;
    data["id"] = id;
    data["title"] = title;
    data["body"] = body;
    return data;
  }
}
