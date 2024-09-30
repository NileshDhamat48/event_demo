class Country {
  int? id;
  String? title;
  String? slug;
  String? image;

  Country({this.id, this.title, this.slug, this.image});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    slug = json['Slug'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['Slug'] = slug;
    data['Image'] = image;
    return data;
  }
}
