import 'package:character_viewer/view_models/character_provider.dart';
import 'package:character_viewer/views/character_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
           ChangeNotifierProvider(create: (_) => CharacterProvider()),
      ],
      child: MaterialApp(
          title: F.title,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: Colors.white,
          ),
          home: _flavorBanner(
            child: const CharacterHome(),
            show: kDebugMode,
          ),
          builder: EasyLoading.init()
      )
    );

  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              child: child,
              location: BannerLocation.topStart,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
              textDirection: TextDirection.ltr,
            )
          : Container(
              child: child,
            );
}
