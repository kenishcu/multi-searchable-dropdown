class DepartmentModelResult {
  int _appVersion;
  String _error;
  List<DepartmentModel> _results = [];

  DepartmentModelResult.fromJson(Map<String, dynamic> parsedJson) {
//    _appVersion = parsedJson['app_version'];
//    _error = parsedJson['errors'];
    List<DepartmentModel> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      DepartmentModel result = DepartmentModel.fromJson(parsedJson['results'][i]);
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

  List<DepartmentModel> get results => _results;

  set results(List<DepartmentModel> value) {
    _results = value;
  }
}

class DepartmentModel {

  int _branchId;
  int _companyId;
  int _inpatientRoomTypeId;
  int _parentId;
  String _parentName;
  String _roomCode;
  int _roomId;
  String _roomName;
  int _roomTypeId;

  DepartmentModel(this._branchId, this._companyId, this._inpatientRoomTypeId, this._parentId,
      this._parentName, this._roomCode, this._roomId, this._roomName, this._roomTypeId);

  factory DepartmentModel.fromJson(dynamic json) {
    return DepartmentModel(json['branch_id'] as int, json['company_id'] as int,
        json['inpatient_room_type_id'] as int, json['parent_id'] as int,
        json['parent_name'] as String, json['room_code'] as String,
        json['room_id'] as int, json['room_name'] as String, json['room_type_id'] as int);
  }

  toJson() {
    return {
      "branch_id": _branchId,
      "company_id": _companyId,
      "inpatient_room_type_id": _inpatientRoomTypeId,
      "parent_id": _parentId,
      "parent_name": _parentName,
      "room_id": _roomId,
      "room_name": _roomName,
      "room_code": _roomCode,
      "room_type_id": _roomTypeId,
    };
  }

  int get branchId => _branchId;

  set branchId(int value) {
    _branchId = value;
  }

  int get companyId => _companyId;

  set companyId(int value) {
    _companyId = value;
  }

  int get inpatientRoomTypeId => _inpatientRoomTypeId;

  set inpatientRoomTypeId(int value) {
    _inpatientRoomTypeId = value;
  }

  int get parentId => _parentId;

  set parentId(int value) {
    _parentId = value;
  }

  String get parentName => _parentName;

  set parentName(String value) {
    _parentName = value;
  }

  String get roomCode => _roomCode;

  set roomCode(String value) {
    _roomCode = value;
  }

  int get roomId => _roomId;

  set roomId(int value) {
    _roomId = value;
  }

  String get roomName => _roomName;

  set roomName(String value) {
    _roomName = value;
  }

  int get roomTypeId => _roomTypeId;

  set roomTypeId(int value) {
    _roomTypeId = value;
  }
}