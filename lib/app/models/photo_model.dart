import 'urls_model.dart';
import 'user_model.dart';

class PhotoModel {
  String? id;
  String? createdAt;
  int? width;
  int? height;
  String? blurHash;
  String? description;
  int? likes;
  Urls? urls;
  User? user;

  PhotoModel({
    this.id,
    this.createdAt,
    this.width,
    this.height,
    this.blurHash,
    this.description,
    this.likes,
    this.urls,
    this.user,
  });

  PhotoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    width = json['width'];
    height = json['height'];
    blurHash = json['blur_hash'];
    description = json['description'];
    likes = json['likes'];
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['width'] = width;
    data['height'] = height;
    data['blur_hash'] = blurHash;
    data['description'] = description;
    data['likes'] = likes;
    if (urls != null) {
      data['urls'] = urls!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
