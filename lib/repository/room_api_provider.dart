import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:itrapp/models/settings/room_model.dart';

import '../constants.dart';

class RoomApiProvider {
  final _baseUrl = API_URL + "/rooms";

  Future<RoomModelResult> fetchRoom() async {

    final response = await http.get( _baseUrl,
//      headers: { HttpHeaders.authorizationHeader: "Bearer $_accessToken"},
    );
    if ( response.statusCode ==  200) {
      return RoomModelResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load rooms');
    }
  }
}