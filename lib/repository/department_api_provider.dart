import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:multisearchabledropdown/model/department_model.dart';

import '../constants.dart';

class DepartmentApiProvider {

  Future<DepartmentModelResult> fetchDepartment() async {
    String data  =  await rootBundle.loadString("lib/data/department.json");
    return DepartmentModelResult.fromJson(json.decode(data));
  }
}