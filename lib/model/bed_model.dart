class BedModel {
  int _bedId;

  int get bedId => _bedId;

  set bedId(int value) {
    _bedId = value;
  }

  String _bedName;

  BedModel(this._bedId, this._bedName);

  factory BedModel.fromJson(dynamic json) {
    return BedModel(json['bed_id'] as int, json['bed_name'] as String);
  }

  toJson() {
    return {
      "bed_id": _bedId,
      "bed_name": _bedName,
    };
  }

  String get bedName => _bedName;

  set bedName(String value) {
    _bedName = value;
  }
}