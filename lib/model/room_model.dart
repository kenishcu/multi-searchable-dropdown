
import 'bed_model.dart';

class RoomModelResult {
  int _appVersion;
  String _error;
  List<RoomModel> _results = [];

  RoomModelResult.fromJson(Map<String, dynamic> parsedJson) {
//    _appVersion = parsedJson['app_version'];
//    _error = parsedJson['errors'];
    List<RoomModel> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      RoomModel result = RoomModel.fromJson(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  int get appVersion => _appVersion;

  set appVersion(int value) {
    _appVersion = value;
  }

  String get error => _error;

  set error(String value) {
    _error = value;
  }

  List<RoomModel> get results => _results;

  set results(List<RoomModel> value) {
    _results = value;
  }
}

class RoomModel{
  int _roomId;
  String _roomName;
  int _parentId;
  String _parentName;
  List<BedModel> _beds;

  RoomModel(this._roomId, this._roomName, this._parentId, this._parentName, this._beds);

  factory RoomModel.fromJson(dynamic json) {
    List<BedModel> beds = [];
    if(json['beds'] != null && json['beds'].length > 0) {
      for(int i = 0; i < json['beds'].length ; i++) {
        beds.add(BedModel.fromJson(json['beds'][i]));
      }
    }
    return RoomModel(json['room_id'] as int, json['room_name'] as String, json['parent_id'] as int,
        json['parent_name'] as String, beds);
  }

  toJson() {
    return {
      "room_id": _roomId,
      "room_name": _roomName,
      "parent_id": _parentId,
      "parent_name": _parentName,
      "beds": _beds,
    };
  }

  int get roomId => _roomId;

  set roomId(int value) {
    _roomId = value;
  }

  String get roomName => _roomName;

  set roomName(String value) {
    _roomName = value;
  }

  int get parentId => _parentId;

  set parentId(int value) {
    _parentId = value;
  }

  String get parentName => _parentName;

  set parentName(String value) {
    _parentName = value;
  }

  List<BedModel> get beds => _beds;

  set beds(List<BedModel> value) {
    _beds = value;
  }

}