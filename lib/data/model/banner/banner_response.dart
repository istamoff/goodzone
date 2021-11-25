

class BannerResponse {

  BannerResponse({
      List<Banners>? banners, 
      String? count,}){
    _banners = banners;
    _count = count;
}

  BannerResponse.fromJson(dynamic json) {
    if (json['banners'] != null) {
      _banners = [];
      json['banners'].forEach((v) {
        _banners?.add(Banners.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<Banners>? _banners;
  String? _count;

  List<Banners>? get banners => _banners;
  String? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_banners != null) {
      map['banners'] = _banners?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

class Banners {
  Banners({
      String? id, 
      String? title, 
      Position? position, 
      bool? active, 
      String? image, 
      String? url, 
      String? description, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _position = position;
    _active = active;
    _image = image;
    _url = url;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Banners.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _position = json['position'] != null ? Position.fromJson(json['position']) : null;
    _active = json['active'];
    _image = json['image'];
    _url = json['url'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _title;
  Position? _position;
  bool? _active;
  String? _image;
  String? _url;
  String? _description;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get title => _title;
  Position? get position => _position;
  bool? get active => _active;
  String? get image => _image;
  String? get url => _url;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    if (_position != null) {
      map['position'] = _position?.toJson();
    }
    map['active'] = _active;
    map['image'] = _image;
    map['url'] = _url;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Position {
  Position({
      String? id, 
      String? title, 
      String? slug, 
      bool? active, 
      String? size, 
      String? description, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _slug = slug;
    _active = active;
    _size = size;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Position.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _active = json['active'];
    _size = json['size'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _title;
  String? _slug;
  bool? _active;
  String? _size;
  String? _description;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get title => _title;
  String? get slug => _slug;
  bool? get active => _active;
  String? get size => _size;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['slug'] = _slug;
    map['active'] = _active;
    map['size'] = _size;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}