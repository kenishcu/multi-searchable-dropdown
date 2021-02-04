import 'dart:io';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:multisearchabledropdown/model/room_model.dart';

import '../constants.dart';

class RoomApiProvider {
  Future<RoomModelResult> fetchRoom() async {

    String data  =  await rootBundle.loadString("lib/data/room.json");
    return RoomModelResult.fromJson(json.decode(data));
  }
}