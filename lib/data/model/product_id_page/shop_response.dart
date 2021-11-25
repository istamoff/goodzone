class ShopResponse {
  ShopResponse({
      List<Shops>? shops,}){
    _shops = shops;
}

  ShopResponse.fromJson(dynamic json) {
    if (json['shops'] != null) {
      _shops = [];
      json['shops'].forEach((v) {
        _shops?.add(Shops.fromJson(v));
      });
    }
  }
  List<Shops>? _shops;

  List<Shops>? get shops => _shops;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_shops != null) {
      map['shops'] = _shops?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Shops {
  Shops({
      Shop? shop, 
      int? quantity,}){
    _shop = shop;
    _quantity = quantity;
}

  Shops.fromJson(dynamic json) {
    _shop = json['shop'] != null ? Shop.fromJson(json['shop']) : null;
    _quantity = json['quantity'];
  }
  Shop? _shop;
  int? _quantity;

  Shop? get shop => _shop;
  int? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_shop != null) {
      map['shop'] = _shop?.toJson();
    }
    map['quantity'] = _quantity;
    return map;
  }

}

class Shop {
  Shop({
      String? id, 
      String? name, 
      String? slug, 
      String? phone, 
      String? workingHours, 
      String? address, 
      String? address2, 
      bool? active, 
      String? previewText, 
      String? image, 
      Loc? loc, 
      String? externalId,}){
    _id = id;
    _name = name;
    _slug = slug;
    _phone = phone;
    _workingHours = workingHours;
    _address = address;
    _address2 = address2;
    _active = active;
    _previewText = previewText;
    _image = image;
    _loc = loc;
    _externalId = externalId;
}

  Shop.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _phone = json['phone'];
    _workingHours = json['working_hours'];
    _address = json['address'];
    _address2 = json['address2'];
    _active = json['active'];
    _previewText = json['preview_text'];
    _image = json['image'];
    _loc = json['loc'] != null ? Loc.fromJson(json['loc']) : null;
    _externalId = json['external_id'];
  }
  String? _id;
  String? _name;
  String? _slug;
  String? _phone;
  String? _workingHours;
  String? _address;
  String? _address2;
  bool? _active;
  String? _previewText;
  String? _image;
  Loc? _loc;
  String? _externalId;

  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get phone => _phone;
  String? get workingHours => _workingHours;
  String? get address => _address;
  String? get address2 => _address2;
  bool? get active => _active;
  String? get previewText => _previewText;
  String? get image => _image;
  Loc? get loc => _loc;
  String? get externalId => _externalId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['phone'] = _phone;
    map['working_hours'] = _workingHours;
    map['address'] = _address;
    map['address2'] = _address2;
    map['active'] = _active;
    map['preview_text'] = _previewText;
    map['image'] = _image;
    if (_loc != null) {
      map['loc'] = _loc?.toJson();
    }
    map['external_id'] = _externalId;
    return map;
  }

}

class Loc {
  Loc({
      double? long, 
      double? lat,}){
    _long = long;
    _lat = lat;
}

  Loc.fromJson(dynamic json) {
    _long = json['long'];
    _lat = json['lat'];
  }
  double? _long;
  double? _lat;

  double? get long => _long;
  double? get lat => _lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['long'] = _long;
    map['lat'] = _lat;
    return map;
  }

}