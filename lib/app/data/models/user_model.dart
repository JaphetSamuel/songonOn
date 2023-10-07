import 'package:pocketbase/pocketbase.dart';

class User {
  String? id;
  String? collectionId;
  String? collectionName;
  String? username;
  bool? verified;
  bool? emailVisibility;
  String? email;
  String? created;
  String? updated;
  String? name;
  String? avatar;

  User(
      {this.id,
      this.collectionId,
      this.collectionName,
      this.username,
      this.verified,
      this.emailVisibility,
      this.email,
      this.created,
      this.updated,
      this.name,
      this.avatar});

  factory User.fromRecord(RecordModel record)=>User.fromJson(record.toJson());

  String get avatarUrl{
    return "http://31.207.35.158:8090/api/files/${this.collectionId}/${this.id}/${this.avatar}";
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    username = json['username'];
    verified = json['verified'];
    emailVisibility = json['emailVisibility'];
    email = json['email'];
    created = json['created'];
    updated = json['updated'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['username'] = username;
    data['verified'] = verified;
    data['emailVisibility'] = emailVisibility;
    data['email'] = email;
    data['created'] = created;
    data['updated'] = updated;
    data['name'] = name;
    data['avatar'] = avatar;
    return data;
  }
}
