import 'package:pocketbase/pocketbase.dart';

class Article {
  String? id;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  String? titre;
  String? contenu;
  String? auteur;
  String? source;
  String? weblink;
  String? image;
  int? popularite;
  String? datePublication;
  String? synopsys;

  Article(
      {this.id,
      this.collectionId,
      this.collectionName,
      this.created,
      this.updated,
      this.titre,
      this.contenu,
      this.auteur,
      this.source,
      this.weblink,
      this.image,
      this.popularite,
        this.synopsys,
      this.datePublication});

  factory Article.fromRecord(RecordModel record) => Article.fromJson(record.toJson());

  String? imageUrl() {
    return 'http://31.207.35.158:8090/api/files/${this.collectionId}/${this.id}/${this.image}';
  }

  List<String?> dateparsed() {
    if(this.datePublication == null) return [];
    return this.datePublication!.split(' ');
  }

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    updated = json['updated'];
    titre = json['titre'];
    contenu = json['contenu'];
    auteur = json['auteur'];
    source = json['source'];
    weblink = json['weblink'];
    image = json['image'];
    popularite = json['popularite'];
    synopsys = json['synopsys'];
    datePublication = json['date_publication'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['updated'] = updated;
    data['titre'] = titre;
    data['contenu'] = contenu;
    data['auteur'] = auteur;
    data['source'] = source;
    data['weblink'] = weblink;
    data['image'] = image;
    data['popularite'] = popularite;
    data['date_publication'] = datePublication;
    return data;
  }
}
