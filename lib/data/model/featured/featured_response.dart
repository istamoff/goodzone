class FeaturedResponse {
  FeaturedResponse({
      String? count, 
      List<FeaturedList>? featuredLists,}){
    _count = count;
    _featuredLists = featuredLists;
}

  FeaturedResponse.fromJson(dynamic json) {
    _count = json['count'];
    if (json['featured_lists'] != null) {
      _featuredLists = [];
      json['featured_lists'].forEach((v) {
        _featuredLists?.add(FeaturedList.fromJson(v));
      });
    }
  }
  String? _count;
  List<FeaturedList>? _featuredLists;

  String? get count => _count;
  List<FeaturedList>? get featuredLists => _featuredLists;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    if (_featuredLists != null) {
      map['featured_lists'] = _featuredLists?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class FeaturedList {
  FeaturedList({
      bool? active, 
      String? createdAt, 
      String? description, 
      String? id, 
      String? lang, 
      String? order, 
      List<Products>? products, 
      String? slug, 
      String? title,}){
    _active = active;
    _createdAt = createdAt;
    _description = description;
    _id = id;
    _lang = lang;
    _order = order;
    _products = products;
    _slug = slug;
    _title = title;
}

  FeaturedList.fromJson(dynamic json) {
    _active = json['active'];
    _createdAt = json['created_at'];
    _description = json['description'];
    _id = json['id'];
    _lang = json['lang'];
    _order = json['order'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _slug = json['slug'];
    _title = json['title'];
  }
  bool? _active;
  String? _createdAt;
  String? _description;
  String? _id;
  String? _lang;
  String? _order;
  List<Products>? _products;
  String? _slug;
  String? _title;

  bool? get active => _active;
  String? get createdAt => _createdAt;
  String? get description => _description;
  String? get id => _id;
  String? get lang => _lang;
  String? get order => _order;
  List<Products>? get products => _products;
  String? get slug => _slug;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['description'] = _description;
    map['id'] = _id;
    map['lang'] = _lang;
    map['order'] = _order;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['slug'] = _slug;
    map['title'] = _title;
    return map;
  }

}

class Products {
  Products({
      bool? active, 
      Brand? brand, 
      Category? category, 
      String? code, 
      String? createdAt, 
      String? externalId, 
      String? id, 
      String? image, 
      String? name,
      String? previewText, 
      Price? price, 
      List<Prices>? prices, 
      List<Properties>? properties, 
      Rules? rules, 
      String? slug, 
      String? updatedAt,}){
    _active = active;
    _brand = brand;
    _category = category;
    _code = code;
    _createdAt = createdAt;
    _externalId = externalId;
    _id = id;
    _image = image;
    _name = name;
    _previewText = previewText;
    _price = price;
    _prices = prices;
    _properties = properties;
    _rules = rules;
    _slug = slug;
    _updatedAt = updatedAt;
}

  Products.fromJson(dynamic json) {
    _active = json['active'];
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _code = json['code'];
    _createdAt = json['created_at'];
    _externalId = json['external_id'];
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _previewText = json['preview_text'];
    _price = json['price'] != null ? Price.fromJson(json['price']) : null;
    if (json['prices'] != null) {
      _prices = [];
      json['prices'].forEach((v) {
        _prices?.add(Prices.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      _properties = [];
      json['properties'].forEach((v) {
        _properties?.add(Properties.fromJson(v));
      });
    }
    _rules = json['rules'] != null ? Rules.fromJson(json['rules']) : null;
    _slug = json['slug'];
    _updatedAt = json['updated_at'];
  }
  bool? _active;
  Brand? _brand;
  Category? _category;
  String? _code;
  String? _createdAt;
  String? _externalId;
  String? _id;
  String? _image;
  String? _name;
  String? _previewText;
  Price? _price;
  List<Prices>? _prices;
  List<Properties>? _properties;
  Rules? _rules;
  String? _slug;
  String? _updatedAt;

  bool? get active => _active;
  Brand? get brand => _brand;
  Category? get category => _category;
  String? get code => _code;
  String? get createdAt => _createdAt;
  String? get externalId => _externalId;
  String? get id => _id;
  String? get image => _image;
  String? get name => _name;
  String? get previewText => _previewText;
  Price? get price => _price;
  List<Prices>? get prices => _prices;
  List<Properties>? get properties => _properties;
  Rules? get rules => _rules;
  String? get slug => _slug;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = _active;
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    map['code'] = _code;
    map['created_at'] = _createdAt;
    map['external_id'] = _externalId;
    map['id'] = _id;
    map['image'] = _image;
    map['name'] = _name;
    map['preview_text'] = _previewText;
    if (_price != null) {
      map['price'] = _price?.toJson();
    }
    if (_prices != null) {
      map['prices'] = _prices?.map((v) => v.toJson()).toList();
    }
    if (_properties != null) {
      map['properties'] = _properties?.map((v) => v.toJson()).toList();
    }
    if (_rules != null) {
      map['rules'] = _rules?.toJson();
    }
    map['slug'] = _slug;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Rules {
  Rules({
      String? cashBack, 
      String? discount, 
      bool? freeDelivery,}){
    _cashBack = cashBack;
    _discount = discount;
    _freeDelivery = freeDelivery;
}

  Rules.fromJson(dynamic json) {
    _cashBack = json['cash_back'];
    _discount = json['discount'];
    _freeDelivery = json['free_delivery'];
  }
  String? _cashBack;
  String? _discount;
  bool? _freeDelivery;

  String? get cashBack => _cashBack;
  String? get discount => _discount;
  bool? get freeDelivery => _freeDelivery;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cash_back'] = _cashBack;
    map['discount'] = _discount;
    map['free_delivery'] = _freeDelivery;
    return map;
  }

}

class Properties {
  Properties({
      String? id, 
      Property? property, 
      String? value,}){
    _id = id;
    _property = property;
    _value = value;
}

  Properties.fromJson(dynamic json) {
    _id = json['id'];
    _property = json['property'] != null ? Property.fromJson(json['property']) : null;
    _value = json['value'];
  }
  String? _id;
  Property? _property;
  String? _value;

  String? get id => _id;
  Property? get property => _property;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_property != null) {
      map['property'] = _property?.toJson();
    }
    map['value'] = _value;
    return map;
  }

}

class Property {
  Property({
      bool? active, 
      String? createdAt, 
      String? description, 
      String? id, 
      String? name, 
      String? order,
      String? slug, 
      String? type, 
      String? updatedAt,}){
    _active = active;
    _createdAt = createdAt;
    _description = description;
    _id = id;
    _name = name;
    _order = order;
    _slug = slug;
    _type = type;
    _updatedAt = updatedAt;
}

  Property.fromJson(dynamic json) {
    _active = json['active'];
    _createdAt = json['created_at'];
    _description = json['description'];
    _id = json['id'];
    _name = json['name'];
    _order = json['order'];
    _slug = json['slug'];
    _type = json['type'];
    _updatedAt = json['updated_at'];
  }
  bool? _active;
  String? _createdAt;
  String? _description;
  String? _id;
  String? _name;
  String? _order;
  String? _slug;
  String? _type;
  String? _updatedAt;

  bool? get active => _active;
  String? get createdAt => _createdAt;
  String? get description => _description;
  String? get id => _id;
  String? get name => _name;
  String? get order => _order;
  String? get slug => _slug;
  String? get type => _type;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['description'] = _description;
    map['id'] = _id;
    map['name'] = _name;
    map['order'] = _order;
    map['slug'] = _slug;
    map['type'] = _type;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
class Prices {
  Prices({
      String? id, 
      String? oldPrice, 
      String? price, 
      String? type,}){
    _id = id;
    _oldPrice = oldPrice;
    _price = price;
    _type = type;
}

  Prices.fromJson(dynamic json) {
    _id = json['id'];
    _oldPrice = json['old_price'];
    _price = json['price'];
    _type = json['type'];
  }
  String? _id;
  String? _oldPrice;
  String? _price;
  String? _type;

  String? get id => _id;
  String? get oldPrice => _oldPrice;
  String? get price => _price;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['old_price'] = _oldPrice;
    map['price'] = _price;
    map['type'] = _type;
    return map;
  }

}

class Price {
  Price({
      String? oldPrice, 
      String? price,}){
    _oldPrice = oldPrice;
    _price = price;
}

  Price.fromJson(dynamic json) {
    _oldPrice = json['old_price'];
    _price = json['price'];
  }
  String? _oldPrice;
  String? _price;

  String? get oldPrice => _oldPrice;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['old_price'] = _oldPrice;
    map['price'] = _price;
    return map;
  }

}


class Category {
  Category({
      bool? active, 
      String? id, 
      String? image, 
      String? name, 
      String? order, 
      Parent? parent, 
      String? slug,}){
    _active = active;
    _id = id;
    _image = image;
    _name = name;
    _order = order;
    _parent = parent;
    _slug = slug;
}

  Category.fromJson(dynamic json) {
    _active = json['active'];
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _order = json['order'];
    _parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    _slug = json['slug'];
  }
  bool? _active;
  String? _id;
  String? _image;
  String? _name;
  String? _order;
  Parent? _parent;
  String? _slug;

  bool? get active => _active;
  String? get id => _id;
  String? get image => _image;
  String? get name => _name;
  String? get order => _order;
  Parent? get parent => _parent;
  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = _active;
    map['id'] = _id;
    map['image'] = _image;
    map['name'] = _name;
    map['order'] = _order;
    if (_parent != null) {
      map['parent'] = _parent?.toJson();
    }
    map['slug'] = _slug;
    return map;
  }

}

class Parent {
  Parent({
      bool? active, 
      String? createdAt, 
      String? description, 
      String? id, 
      String? image, 
      String? name, 
      String? order, 
      String? slug, 
      String? updatedAt,}){
    _active = active;
    _createdAt = createdAt;
    _description = description;
    _id = id;
    _image = image;
    _name = name;
    _order = order;
    _slug = slug;
    _updatedAt = updatedAt;
}

  Parent.fromJson(dynamic json) {
    _active = json['active'];
    _createdAt = json['created_at'];
    _description = json['description'];
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _order = json['order'];
    _slug = json['slug'];
    _updatedAt = json['updated_at'];
  }
  bool? _active;
  String? _createdAt;
  String? _description;
  String? _id;
  String? _image;
  String? _name;
  String? _order;
  String? _slug;
  String? _updatedAt;

  bool? get active => _active;
  String? get createdAt => _createdAt;
  String? get description => _description;
  String? get id => _id;
  String? get image => _image;
  String? get name => _name;
  String? get order => _order;
  String? get slug => _slug;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['description'] = _description;
    map['id'] = _id;
    map['image'] = _image;
    map['name'] = _name;
    map['order'] = _order;
    map['slug'] = _slug;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Brand {
  Brand({
      bool? active, 
      String? createdAt, 
      String? description, 
      String? id, 
      String? image, 
      String? name, 
      String? order, 
      String? previewText, 
      String? slug, 
      String? updatedAt,}){
    _active = active;
    _createdAt = createdAt;
    _description = description;
    _id = id;
    _image = image;
    _name = name;
    _order = order;
    _previewText = previewText;
    _slug = slug;
    _updatedAt = updatedAt;
}

  Brand.fromJson(dynamic json) {
    _active = json['active'];
    _createdAt = json['created_at'];
    _description = json['description'];
    _id = json['id'];
    _image = json['image'];
    _name = json['name'];
    _order = json['order'];
    _previewText = json['preview_text'];
    _slug = json['slug'];
    _updatedAt = json['updated_at'];
  }
  bool? _active;
  String? _createdAt;
  String? _description;
  String? _id;
  String? _image;
  String? _name;
  String? _order;
  String? _previewText;
  String? _slug;
  String? _updatedAt;

  bool? get active => _active;
  String? get createdAt => _createdAt;
  String? get description => _description;
  String? get id => _id;
  String? get image => _image;
  String? get name => _name;
  String? get order => _order;
  String? get previewText => _previewText;
  String? get slug => _slug;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active'] = _active;
    map['created_at'] = _createdAt;
    map['description'] = _description;
    map['id'] = _id;
    map['image'] = _image;
    map['name'] = _name;
    map['order'] = _order;
    map['preview_text'] = _previewText;
    map['slug'] = _slug;
    map['updated_at'] = _updatedAt;
    return map;
  }

}