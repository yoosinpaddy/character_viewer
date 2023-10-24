import 'package:character_viewer/models/character_results.dart';
import 'package:character_viewer/models/rest_client.dart';
import 'package:flutter/material.dart';

class CharacterProvider extends ChangeNotifier {
  final _restClient = RestClient();
  CharacterResults _characterResults = CharacterResults();
  List<RelatedTopics> _displayCharacters = [];
  bool showingDetails = false;
  bool isTablet = false;
  bool isSearching = false;
  RelatedTopics? selectedCharacter;

  List<RelatedTopics> get displayCharacters => _displayCharacters;

  CharacterProvider() {
    _fetchCharacters();
  }

  void _fetchCharacters() async {
    _characterResults = await _restClient.fetchCharacters();
    _filterList('');
    notifyListeners();
  }

  void filterCharacters(String searchTerm) {
    debugPrint("filterCharacters");
    _filterList(searchTerm);
    notifyListeners();
  }

  void _filterList(String searchTerm) {
    if(searchTerm.isEmpty) {
      _displayCharacters = _characterResults.relatedTopics!;
      return;
    }

    _displayCharacters = _characterResults.relatedTopics!.where((character) {
      return (character.text?.toLowerCase().contains(searchTerm.toLowerCase()) == true);
    }).toList();
  }

  void showDetails(RelatedTopics character) {
    selectedCharacter = character;
    showingDetails = true;
    notifyListeners();
  }

  void hideDetails() {
    selectedCharacter = null;
    showingDetails = false;
    notifyListeners();
  }

  void toggleTablet(bool isTablet) {
    if(this.isTablet == isTablet) return;
    this.isTablet = isTablet;
    notifyListeners();
  }

}