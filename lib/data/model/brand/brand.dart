class BrandsResponse {
  BrandsResponse({
      List<Brands>? brands, 
      String? count,}){
    _brands = brands;
    _count = count;
}

  BrandsResponse.fromJson(dynamic json) {
    if (json['brands'] != null) {
      _brands = [];
      json['brands'].forEach((v) {
        _brands?.add(Brands.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<Brands>? _brands;
  String? _count;

  List<Brands>? get brands => _brands;
  String? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_brands != null) {
      map['brands'] = _brands?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

class Brands {
  Brands({
      String? id, 
      String? name, 
      String? slug, 
      bool? active, 
      String? previewText, 
      String? description, 
      String? image, 
      String? createdAt, 
      String? updatedAt, 
      String? order,}){
    _id = id;
    _name = name;
    _slug = slug;
    _active = active;
    _previewText = previewText;
    _description = description;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _order = order;
}

  Brands.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _active = json['active'];
    _previewText = json['preview_text'];
    _description = json['description'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _order = json['order'];
  }
  String? _id;
  String? _name;
  String? _slug;
  bool? _active;
  String? _previewText;
  String? _description;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  String? _order;

  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  bool? get active => _active;
  String? get previewText => _previewText;
  String? get description => _description;
  String? get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get order => _order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['active'] = _active;
    map['preview_text'] = _previewText;
    map['description'] = _description;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['order'] = _order;
    return map;
  }

}