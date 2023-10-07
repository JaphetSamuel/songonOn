import 'package:pocketbase/pocketbase.dart';

class Commerce  {
  String? id;
  String? collectionId;
  String? collectionName;
  String? created;
  String? updated;
  String? nom;
  String? description;
  String? adresse;
  List<String>? categorie;
  bool? actif;
  String? siteweb;
  String? telephone;
  String? horaire;
  String? image;
  Map<String,dynamic>? coordonnee;

  Commerce(
      {this.id,
      this.collectionId,
      this.collectionName,
      this.created,
      this.updated,
      this.nom,
      this.description,
      this.adresse,
      this.categorie,
      this.actif,
      this.siteweb,
      this.telephone,
      this.horaire,
      this.image,
      this.coordonnee});

  String? imageUrl(){
    return 'http://31.207.35.158:8090/api/files/${this.collectionId}/${this.id}/${this.image}';
  }

  factory Commerce.fromRecord(RecordModel record) => Commerce.fromJson(record.toJson());

  Commerce.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    updated = json['updated'];
    nom = json['nom'];
    description = json['description'];
    adresse = json['adresse'];
    categorie = json['categorie'].cast<String>();
    actif = json['actif'];
    siteweb = json['siteweb'];
    telephone = json['telephone'];
    horaire = json['horaire'];
    image = json['image'];
    coordonnee = json['coordonnee'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['collectionId'] = collectionId;
    data['collectionName'] = collectionName;
    data['created'] = created;
    data['updated'] = updated;
    data['nom'] = nom;
    data['description'] = description;
    data['adresse'] = adresse;
    data['categorie'] = categorie;
    data['actif'] = actif;
    data['siteweb'] = siteweb;
    data['telephone'] = telephone;
    data['horaire'] = horaire;
    data['image'] = image;
    data['coordonnee'] = coordonnee;
    return data;
  }
}
