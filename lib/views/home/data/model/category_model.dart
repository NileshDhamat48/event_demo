class CategoryData {
  int? id;
  String? title;
  String? slug;
  String? content;
  String? image;
  String? hidImage;
  String? icon;
  String? hidIcon;
  int? status;
  String? entDt;

  CategoryData(
      {this.id,
      this.title,
      this.slug,
      this.content,
      this.image,
      this.hidImage,
      this.icon,
      this.hidIcon,
      this.status,
      this.entDt});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    slug = json['Slug'];
    content = json['Content'];
    image = json['Image'];
    hidImage = json['Hid_Image'];
    icon = json['Icon'];
    hidIcon = json['Hid_Icon'];
    status = json['Status'];
    entDt = json['EntDt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['Slug'] = slug;
    data['Content'] = content;
    data['Image'] = image;
    data['Hid_Image'] = hidImage;
    data['Icon'] = icon;
    data['Hid_Icon'] = hidIcon;
    data['Status'] = status;
    data['EntDt'] = entDt;
    return data;
  }
}
