class City {
  int? id;
  int? countryId;
  String? countryTitle;
  String? title;
  String? slug;
  String? image;

  City(
      {this.id,
      this.countryId,
      this.countryTitle,
      this.title,
      this.slug,
      this.image});

  City.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    countryId = json['CountryId'];
    countryTitle = json['CountryTitle'];
    title = json['Title'];
    slug = json['Slug'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CountryId'] = countryId;
    data['CountryTitle'] = countryTitle;
    data['Title'] = title;
    data['Slug'] = slug;
    data['Image'] = image;
    return data;
  }
}
