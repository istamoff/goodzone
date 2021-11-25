class NewsResponse {
  NewsResponse({
      List<News>? news, 
      String? count,}){
    _news = news;
    _count = count;
}

  NewsResponse.fromJson(dynamic json) {
    if (json['news'] != null) {
      _news = [];
      json['news'].forEach((v) {
        _news?.add(News.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<News>? _news;
  String? _count;

  List<News>? get news => _news;
  String? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_news != null) {
      map['news'] = _news?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

class News {
  News({
      String? id, 
      String? title, 
      String? slug, 
      String? imageURL, 
      String? previewImage, 
      String? fullText, 
      String? description, 
      bool? active, 
      Meta? meta, 
      String? createdAt, 
      String? updatedAt, 
      String? formattedDate,}){
    _id = id;
    _title = title;
    _slug = slug;
    _imageURL = imageURL;
    _previewImage = previewImage;
    _fullText = fullText;
    _description = description;
    _active = active;
    _meta = meta;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _formattedDate = formattedDate;
}

  News.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _imageURL = json['imageURL'];
    _previewImage = json['preview_image'];
    _fullText = json['full_text'];
    _description = json['description'];
    _active = json['active'];
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _formattedDate = json['formatted_date'];
  }
  String? _id;
  String? _title;
  String? _slug;
  String? _imageURL;
  String? _previewImage;
  String? _fullText;
  String? _description;
  bool? _active;
  Meta? _meta;
  String? _createdAt;
  String? _updatedAt;
  String? _formattedDate;

  String? get id => _id;
  String? get title => _title;
  String? get slug => _slug;
  String? get imageURL => _imageURL;
  String? get previewImage => _previewImage;
  String? get fullText => _fullText;
  String? get description => _description;
  bool? get active => _active;
  Meta? get meta => _meta;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get formattedDate => _formattedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['slug'] = _slug;
    map['imageURL'] = _imageURL;
    map['preview_image'] = _previewImage;
    map['full_text'] = _fullText;
    map['description'] = _description;
    map['active'] = _active;
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['formatted_date'] = _formattedDate;
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