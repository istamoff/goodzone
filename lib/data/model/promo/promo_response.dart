class PromoResponse {
  PromoResponse({
      List<Promos>? promos, 
      int? count,}){
    _promos = promos;
    _count = count;
}

  PromoResponse.fromJson(dynamic json) {
    if (json['promos'] != null) {
      _promos = [];
      json['promos'].forEach((v) {
        _promos?.add(Promos.fromJson(v));
      });
    }
    _count = json['count'];
  }
  List<Promos>? _promos;
  int? _count;

  List<Promos>? get promos => _promos;
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_promos != null) {
      map['promos'] = _promos?.map((v) => v.toJson()).toList();
    }
    map['count'] = _count;
    return map;
  }

}

class Promos {
  Promos({
      String? id, 
      String? title, 
      String? slug, 
      bool? active, 
      String? previewImage, 
      String? startTime, 
      String? endTime, 
      String? createdAt, 
      String? updatedAt, 
      String? formattedStartDate, 
      String? formattedEndDate, 
      String? formattedDate, 
      String? lang,}){
    _id = id;
    _title = title;
    _slug = slug;
    _active = active;
    _previewImage = previewImage;
    _startTime = startTime;
    _endTime = endTime;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _formattedStartDate = formattedStartDate;
    _formattedEndDate = formattedEndDate;
    _formattedDate = formattedDate;
    _lang = lang;
}

  Promos.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _slug = json['slug'];
    _active = json['active'];
    _previewImage = json['preview_image'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _formattedStartDate = json['formatted_start_date'];
    _formattedEndDate = json['formatted_end_date'];
    _formattedDate = json['formatted_date'];
    _lang = json['lang'];
  }
  String? _id;
  String? _title;
  String? _slug;
  bool? _active;
  String? _previewImage;
  String? _startTime;
  String? _endTime;
  String? _createdAt;
  String? _updatedAt;
  String? _formattedStartDate;
  String? _formattedEndDate;
  String? _formattedDate;
  String? _lang;

  String? get id => _id;
  String? get title => _title;
  String? get slug => _slug;
  bool? get active => _active;
  String? get previewImage => _previewImage;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get formattedStartDate => _formattedStartDate;
  String? get formattedEndDate => _formattedEndDate;
  String? get formattedDate => _formattedDate;
  String? get lang => _lang;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['slug'] = _slug;
    map['active'] = _active;
    map['preview_image'] = _previewImage;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['formatted_start_date'] = _formattedStartDate;
    map['formatted_end_date'] = _formattedEndDate;
    map['formatted_date'] = _formattedDate;
    map['lang'] = _lang;
    return map;
  }

}