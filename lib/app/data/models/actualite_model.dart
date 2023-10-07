class Actualite {
  String? id;
  String? titre;
  String? contenu;
  String? datePublication;
  String? auteur;
  String? source;
  List<String>? tags;
  String? imageUrl;

  Actualite(
      {this.id,
      this.titre,
      this.contenu,
      this.datePublication,
      this.auteur,
      this.source,
      this.tags,
      this.imageUrl});

  Actualite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titre = json['titre'];
    contenu = json['contenu'];
    datePublication = json['date_publication'];
    auteur = json['auteur'];
    source = json['source'];
    tags = json['tags'].cast<String>();
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['titre'] = titre;
    data['contenu'] = contenu;
    data['date_publication'] = datePublication;
    data['auteur'] = auteur;
    data['source'] = source;
    data['tags'] = tags;
    data['image_url'] = imageUrl;
    return data;
  }
}
