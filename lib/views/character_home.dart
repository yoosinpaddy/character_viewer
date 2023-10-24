import 'package:cached_network_image/cached_network_image.dart';
import 'package:character_viewer/models/character_results.dart';
import 'package:character_viewer/view_models/character_provider.dart';
import 'package:character_viewer/view_models/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CharacterHome extends StatefulWidget {
  const CharacterHome({Key? key}) : super(key: key);

  @override
  _CharacterHomeState createState() => _CharacterHomeState();
}

class _CharacterHomeState extends State<CharacterHome> {
  TextEditingController _searchController = TextEditingController();
  RelatedTopics? selectedCharacter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController.addListener(() {
      Provider.of<CharacterProvider>(context, listen: false).filterCharacters(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterProvider>(builder: (context, provider, child) {
      if (provider.displayCharacters.isEmpty) {
        selectedCharacter = null;
      } else {
        selectedCharacter ??= provider.displayCharacters.first;
      }
      return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          provider.toggleTablet(orientation == Orientation.landscape || MediaQuery.of(context).size.width > 600);
          return Scaffold(
              appBar: Utils.buildAppBar(provider, _searchController),
              body: (orientation == Orientation.portrait || !provider.isTablet) ? _buildPortrait(provider) : _buildLandscape(provider));
        },
      );
    });
  }
}

class _buildPortrait extends StatelessWidget {
  final CharacterProvider provider;

  _buildPortrait(this.provider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterProvider>(builder: (BuildContext context, CharacterProvider provider, Widget? child) {
      if (provider.showingDetails) {
        return DetailWidgetWidget(provider);
      } else {
        return SummaryWidget(provider);
      }
    });
  }
}

class _buildLandscape extends StatelessWidget {
  final CharacterProvider provider;

  _buildLandscape(this.provider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: SummaryWidget(provider)),
        Expanded(flex: 7, child: DetailWidgetWidget(provider)),
      ],
    );
  }
}

class SummaryWidget extends StatelessWidget {
  final CharacterProvider provider;

  SummaryWidget(this.provider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: provider.displayCharacters.length,

      itemBuilder: (BuildContext context, int index) {
        RelatedTopics character = provider.displayCharacters[index];
        return InkWell(
          onTap: () {
            provider.showDetails(character);
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: provider.selectedCharacter == character ? Colors.grey : Colors.white,
            ),
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: [
                //image and summary
                /*CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(Utils.getIconLink(character.icon?.uRL)),
                ),
                const SizedBox(width: 10.0),*/
                //text with one line
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.getName(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: provider.isTablet ? 20.0 : 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DetailWidgetWidget extends StatelessWidget {
  final CharacterProvider? provider;
  final WebViewController controller = WebViewController();
   bool _isLoading = false;

  DetailWidgetWidget(this.provider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (provider?.selectedCharacter == null) {
      return Container(
        child: const Center(
          child: Text('No character selected'),
        ),
      );
    }
    controller.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {
          _isLoading = true;
          EasyLoading.show(status: 'Loading...');
        },
        onPageFinished: (String url) {
          _isLoading = false;
          Future.delayed(const Duration(seconds: 2), () {
            if (!_isLoading) {
              EasyLoading.dismiss();
            }
          });
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
    controller.loadRequest(Uri.parse(provider?.selectedCharacter?.firstURL ?? ''));
    return WebViewWidget(controller: controller);
  }
}
