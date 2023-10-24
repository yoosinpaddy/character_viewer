// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:character_viewer/flavors.dart';
import 'package:character_viewer/models/character_results.dart';
import 'package:character_viewer/models/rest_client.dart';
import 'package:character_viewer/view_models/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:character_viewer/main.dart';

void main() {

  test('Test Url append', () {
    expect(Utils.getIconLink(''), Utils.dummyAvatar);
    expect(Utils.getIconLink('/test'), 'https://www.duckduckgo.com/test');
  });

  test('Test RestClient', () async {
    F.setAppFlavor(Flavor.simpsons);
    RestClient restClient = RestClient();
    try {
      CharacterResults characterResults = await restClient.fetchCharacters();
      expect(characterResults.relatedTopics!.length,greaterThanOrEqualTo(1));
    } catch (e) {
      fail(e.toString());
    }
  });

  test('Base urls', () {

    F.setAppFlavor(Flavor.simpsons);
    expect(F.BASE_URL, 'http://api.duckduckgo.com/?q=simpsons+characters&format=json');
    F.setAppFlavor(Flavor.wire);
    expect(F.BASE_URL, 'http://api.duckduckgo.com/?q=the+wire+characters&format=json');
  });
}
