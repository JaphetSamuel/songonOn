import 'package:pocketbase/pocketbase.dart';

class Spot {
  String? id;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  String? description;
  String? image;
  String? link;
  String? titre;

  Spot(
      {this.id,
      this.collectionId,
      this.collectionName,
      this.created,
      this.updated,
      this.description,
      this.image,
      this.link,
      this.titre});

  factory Spot.fromRecord(RecordModel record) => Spot.fromJson(record.toJson());

  String get imageUrl {
    return 'http://31.207.35.158:8090/api/files/${this.collectionId}/${this.id}/${this.image}';
  }


  Spot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    updated = json['updated'];
    description = json['description'];
    image = json['Image'];
    link = json['link'];
    titre = json['titre'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['updated'] = updated;
    data['description'] = description;
    data['Image'] = image;
    data['link'] = link;
    data['titre'] = titre;
    return data;
  }
}
