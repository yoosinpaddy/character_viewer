import 'dart:async';
import 'dart:convert';
import 'package:character_viewer/models/character_results.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../flavors.dart';


class RestClient{

  Future<CharacterResults> fetchCharacters() async {
    debugPrint('getData API:"${F.BASE_URL}"');

    final response = await get(Uri.parse(F.BASE_URL));

    debugPrint('Status code: ${response.statusCode}');
    debugPrint('Body: ${response.body}');

    if (response.statusCode == 200) {
      return CharacterResults.fromJson(jsonDecode(response.body));
    } else {
        throw Exception("Error getting data with status ${response.statusCode}");
    }
  }


}
