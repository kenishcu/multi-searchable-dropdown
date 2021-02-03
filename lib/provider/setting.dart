import 'package:flutter/material.dart';
import 'package:multisearchabledropdown/model/department_model.dart';
import 'package:multisearchabledropdown/model/room_model.dart';
import 'package:multisearchabledropdown/repository/department_api_provider.dart';
import 'package:multisearchabledropdown/repository/room_api_provider.dart';

class SettingProvider with ChangeNotifier {

  List<DepartmentModel> _listDepartment;

  List<DepartmentModel> get listDepartment => _listDepartment;

  set listDepartment(List<DepartmentModel> value) {
    _listDepartment = value;
  }

  DepartmentModel _selectedDepartment;

  List<RoomModel> _listRoomBed;

  List<RoomModel> _listRoom;

  loadPreferences() async {
    // load departmemts info
    final departmentApiProvider = new DepartmentApiProvider();
    DepartmentModelResult resDepartment = await departmentApiProvider.fetchDepartment();
    List<DepartmentModel> listDepartment = resDepartment.results;

    if(listDepartment != null) setListDepartment(listDepartment);

    // load rooms info
    final roomApiProvider = new RoomApiProvider();
    RoomModelResult resRoom = await roomApiProvider.fetchRoom();
    List<RoomModel> listRoomBed = resRoom.results;

    if(listRoomBed != null) setListRoomBed(listRoomBed);
  }

  DepartmentModel get selectedDepartment => _selectedDepartment;

  List<RoomModel> get listRoom => _listRoom;

  set listRoom(List<RoomModel> value) {
    _listRoom = value;
  }

  List<RoomModel> get listRoomBed => _listRoomBed;

  void setListDepartment(List<DepartmentModel> listDepartment) {
    _listDepartment = listDepartment;
    notifyListeners();
  }

  set listRoomBed(List<RoomModel> value) {
    _listRoomBed = value;
  }

  set selectedDepartment(DepartmentModel value) {
    _selectedDepartment = value;
  }

  void setListRoomBed(List<RoomModel> listRoom) {
    _listRoomBed = listRoom;
    notifyListeners();
  }
}