class ProductIdPageResponse {
  ProductIdPageResponse({
      Product? product,}){
    _product = product;
}

  ProductIdPageResponse.fromJson(dynamic json) {
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  Product? _product;

  Product? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    return map;
  }

}

class Product {
  Product({
      String? id, 
      String? name, 
      String? slug, 
      Category? category, 
      dynamic additionalCategories, 
      List<Related_products>? relatedProducts, 
      Brand? brand, 
      String? previewText, 
      String? description, 
      bool? active, 
      dynamic properties, 
      List<Prices>? prices, 
      Price? price, 
      String? image, 
      List<String>? gallery, 
      int? averageRate, 
      String? reviewsCount, 
      Meta? meta, 
      String? externalId, 
      String? code, 
      String? createdAt, 
      String? updatedAt, 
      Rules? rules,}){
    _id = id;
    _name = name;
    _slug = slug;
    _category = category;
    _additionalCategories = additionalCategories;
    _relatedProducts = relatedProducts;
    _brand = brand;
    _previewText = previewText;
    _description = description;
    _active = active;
    _properties = properties;
    _prices = prices;
    _price = price;
    _image = image;
    _gallery = gallery;
    _averageRate = averageRate;
    _reviewsCount = reviewsCount;
    _meta = meta;
    _externalId = externalId;
    _code = code;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _rules = rules;
}

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _additionalCategories = json['additional_categories'];
    if (json['related_products'] != null) {
      _relatedProducts = [];
      json['related_products'].forEach((v) {
        _relatedProducts?.add(Related_products.fromJson(v));
      });
    }
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _previewText = json['preview_text'];
    _description = json['description'];
    _active = json['active'];
    _properties = json['properties'];
    if (json['prices'] != null) {
      _prices = [];
      json['prices'].forEach((v) {
        _prices?.add(Prices.fromJson(v));
      });
    }
    _price = json['price'] != null ? Price.fromJson(json['price']) : null;
    _image = json['image'];
    _gallery = json['gallery'] != null ? json['gallery'].cast<String>() : [];
    _averageRate = json['average_rate'];
    _reviewsCount = json['reviews_count'];
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _externalId = json['external_id'];
    _code = json['code'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _rules = json['rules'] != null ? Rules.fromJson(json['rules']) : null;
  }
  String? _id;
  String? _name;
  String? _slug;
  Category? _category;
  dynamic _additionalCategories;
  List<Related_products>? _relatedProducts;
  Brand? _brand;
  String? _previewText;
  String? _description;
  bool? _active;
  dynamic _properties;
  List<Prices>? _prices;
  Price? _price;
  String? _image;
  List<String>? _gallery;
  int? _averageRate;
  String? _reviewsCount;
  Meta? _meta;
  String? _externalId;
  String? _code;
  String? _createdAt;
  String? _updatedAt;
  Rules? _rules;

  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  Category? get category => _category;
  dynamic get additionalCategories => _additionalCategories;
  List<Related_products>? get relatedProducts => _relatedProducts;
  Brand? get brand => _brand;
  String? get previewText => _previewText;
  String? get description => _description;
  bool? get active => _active;
  dynamic get properties => _properties;
  List<Prices>? get prices => _prices;
  Price? get price => _price;
  String? get image => _image;
  List<String>? get gallery => _gallery;
  int? get averageRate => _averageRate;
  String? get reviewsCount => _reviewsCount;
  Meta? get meta => _meta;
  String? get externalId => _externalId;
  String? get code => _code;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Rules? get rules => _rules;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    map['additional_categories'] = _additionalCategories;
    if (_relatedProducts != null) {
      map['related_products'] = _relatedProducts?.map((v) => v.toJson()).toList();
    }
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    map['preview_text'] = _previewText;
    map['description'] = _description;
    map['active'] = _active;
    map['properties'] = _properties;
    if (_prices != null) {
      map['prices'] = _prices?.map((v) => v.toJson()).toList();
    }
    if (_price != null) {
      map['price'] = _price?.toJson();
    }
    map['image'] = _image;
    map['gallery'] = _gallery;
    map['average_rate'] = _averageRate;
    map['reviews_count'] = _reviewsCount;
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    map['external_id'] = _externalId;
    map['code'] = _code;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_rules != null) {
      map['rules'] = _rules?.toJson();
    }
    return map;
  }

}

class Rules {
  Rules({
      String? discount, 
      String? cashBack, 
      bool? freeDelivery,}){
    _discount = discount;
    _cashBack = cashBack;
    _freeDelivery = freeDelivery;
}

  Rules.fromJson(dynamic json) {
    _discount = json['discount'];
    _cashBack = json['cash_back'];
    _freeDelivery = json['free_delivery'];
  }
  String? _discount;
  String? _cashBack;
  bool? _freeDelivery;

  String? get discount => _discount;
  String? get cashBack => _cashBack;
  bool? get freeDelivery => _freeDelivery;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['discount'] = _discount;
    map['cash_back'] = _cashBack;
    map['free_delivery'] = _freeDelivery;
    return map;
  }

}


class Meta {
  Meta({
      String? title, 
      String? description, 
      String? tags,}){
    _title = title;
    _description = description;
    _tags = tags;
}

  Meta.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    _tags = json['tags'];
  }
  String? _title;
  String? _description;
  String? _tags;

  String? get title => _title;
  String? get description => _description;
  String? get tags => _tags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['tags'] = _tags;
    return map;
  }

}

class Price {
  Price({
      String? price, 
      String? oldPrice,}){
    _price = price;
    _oldPrice = oldPrice;
}

  Price.fromJson(dynamic json) {
    _price = json['price'];
    _oldPrice = json['old_price'];
  }
  String? _price;
  String? _oldPrice;

  String? get price => _price;
  String? get oldPrice => _oldPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = _price;
    map['old_price'] = _oldPrice;
    return map;
  }

}

class Prices {
  Prices({
      String? id, 
      String? type, 
      String? price, 
      String? oldPrice,}){
    _id = id;
    _type = type;
    _price = price;
    _oldPrice = oldPrice;
}

  Prices.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _price = json['price'];
    _oldPrice = json['old_price'];
  }
  String? _id;
  String? _type;
  String? _price;
  String? _oldPrice;

  String? get id => _id;
  String? get type => _type;
  String? get price => _price;
  String? get oldPrice => _oldPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['price'] = _price;
    map['old_price'] = _oldPrice;
    return map;
  }

}

class Brand {
  Brand({
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

  Brand.fromJson(dynamic json) {
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

class Related_products {
  Related_products({
      String? id, 
      String? name, 
      String? slug, 
      Category? category, 
      Brand? brand, 
      String? previewText, 
      bool? active, 
      Price? price, 
      List<Prices>? prices, 
      String? image, 
      String? externalId, 
      String? code, 
      String? createdAt, 
      String? updatedAt, 
      Rules? rules,
      List<Properties>? properties,}){
    _id = id;
    _name = name;
    _slug = slug;
    _category = category;
    _brand = brand;
    _previewText = previewText;
    _active = active;
    _price = price;
    _prices = prices;
    _image = image;
    _externalId = externalId;
    _code = code;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _rules = rules;
    _properties = properties;
}

  Related_products.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _previewText = json['preview_text'];
    _active = json['active'];
    _price = json['price'] != null ? Price.fromJson(json['price']) : null;
    if (json['prices'] != null) {
      _prices = [];
      json['prices'].forEach((v) {
        _prices?.add(Prices.fromJson(v));
      });
    }
    _image = json['image'];
    _externalId = json['external_id'];
    _code = json['code'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _rules = json['rules'] != null ? Rules.fromJson(json['rules']) : null;
    if (json['properties'] != null) {
      _properties = [];
      json['properties'].forEach((v) {
        _properties?.add(Properties.fromJson(v));
      });
    }
  }
  String? _id;
  String? _name;
  String? _slug;
  Category? _category;
  Brand? _brand;
  String? _previewText;
  bool? _active;
  Price? _price;
  List<Prices>? _prices;
  String? _image;
  String? _externalId;
  String? _code;
  String? _createdAt;
  String? _updatedAt;
  Rules? _rules;
  List<Properties>? _properties;

  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  Category? get category => _category;
  Brand? get brand => _brand;
  String? get previewText => _previewText;
  bool? get active => _active;
  Price? get price => _price;
  List<Prices>? get prices => _prices;
  String? get image => _image;
  String? get externalId => _externalId;
  String? get code => _code;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  Rules? get rules => _rules;
  List<Properties>? get properties => _properties;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    map['preview_text'] = _previewText;
    map['active'] = _active;
    if (_price != null) {
      map['price'] = _price?.toJson();
    }
    if (_prices != null) {
      map['prices'] = _prices?.map((v) => v.toJson()).toList();
    }
    map['image'] = _image;
    map['external_id'] = _externalId;
    map['code'] = _code;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_rules != null) {
      map['rules'] = _rules?.toJson();
    }
    if (_properties != null) {
      map['properties'] = _properties?.map((v) => v.toJson()).toList();
    }
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
      String? id, 
      String? name, 
      String? slug, 
      String? type, 
      dynamic options, 
      bool? active, 
      String? description, 
      String? order, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _slug = slug;
    _type = type;
    _options = options;
    _active = active;
    _description = description;
    _order = order;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Property.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _type = json['type'];
    _options = json['options'];
    _active = json['active'];
    _description = json['description'];
    _order = json['order'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _name;
  String? _slug;
  String? _type;
  dynamic _options;
  bool? _active;
  String? _description;
  String? _order;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get type => _type;
  dynamic get options => _options;
  bool? get active => _active;
  String? get description => _description;
  String? get order => _order;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['type'] = _type;
    map['options'] = _options;
    map['active'] = _active;
    map['description'] = _description;
    map['order'] = _order;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Category {
  Category({
      String? id, 
      String? name, 
      String? slug, 
      Parent? parent, 
      bool? active, 
      String? order, 
      String? image,}){
    _id = id;
    _name = name;
    _slug = slug;
    _parent = parent;
    _active = active;
    _order = order;
    _image = image;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    _active = json['active'];
    _order = json['order'];
    _image = json['image'];
  }
  String? _id;
  String? _name;
  String? _slug;
  Parent? _parent;
  bool? _active;
  String? _order;
  String? _image;

  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  Parent? get parent => _parent;
  bool? get active => _active;
  String? get order => _order;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    if (_parent != null) {
      map['parent'] = _parent?.toJson();
    }
    map['active'] = _active;
    map['order'] = _order;
    map['image'] = _image;
    return map;
  }

}

class Parent {
  Parent({
      String? id, 
      String? name, 
      String? slug, 
      bool? active, 
      String? description, 
      String? order, 
      String? image, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _slug = slug;
    _active = active;
    _description = description;
    _order = order;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Parent.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _active = json['active'];
    _description = json['description'];
    _order = json['order'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _name;
  String? _slug;
  bool? _active;
  String? _description;
  String? _order;
  String? _image;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  bool? get active => _active;
  String? get description => _description;
  String? get order => _order;
  String? get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['active'] = _active;
    map['description'] = _description;
    map['order'] = _order;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

