import 'dart:io';
import 'dart:convert';
import 'package:multisearchabledropdown/model/department_model.dart';

import '../constants.dart';

class DepartmentApiProvider {
  final _baseUrl = API_URL + "/parents";

  Future<DepartmentModelResult> fetchDepartment() async {

    final response = await http.get(_baseUrl);
    if ( response.statusCode ==  200) {
      return DepartmentModelResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load departments');
    }
  }
}