class SliderData {
  int? id;
  String? title;
  String? image;

  SliderData({this.id, this.title, this.image});

  SliderData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['Image'] = image;
    return data;
  }
}