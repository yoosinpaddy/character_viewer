import 'package:character_viewer/flavors.dart';
import 'package:character_viewer/view_models/character_provider.dart';
import 'package:flutter/material.dart';

class Utils {
  static const String dummyAvatar = "https://i.pravatar.cc/150?img=68";

  static String getIconLink(String? url) {
    if (url == null || url.isEmpty) {
      return dummyAvatar;
    }
    return "https://www.duckduckgo.com$url";
  }

  static buildAppBar(CharacterProvider provider, TextEditingController _searchController) {
    return AppBar(title: StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
      return (!provider.isTablet && provider.showingDetails)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => provider.hideDetails(),
                  icon: const Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: Container(),
                )
              ],
            )
          : provider.isSearching
              ? Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          provider.isSearching = false;
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                          focusColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white,),
                          hintStyle: TextStyle(color: Colors.white,),
                          counterStyle: TextStyle(color: Colors.white,),
                        ),
                        style: const TextStyle(color: Colors.white,),
                        focusNode: FocusNode(),
                        controller: _searchController,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Icon(Icons.search),
                  ],
                )
              : Row(
                  children: [
                    Text(F.name),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        debugPrint("Search");
                        setState(() {
                          provider.isSearching = true;
                        });
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                );
    }));
  }
}
