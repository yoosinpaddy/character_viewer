enum Flavor {
  simpsons,
  wire,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  //setting flavor only for tests
  static void setAppFlavor(Flavor flavor) {
    appFlavor = flavor;
  }

  static String get title {
    switch (appFlavor) {
      case Flavor.simpsons:
        return 'Simpsons Character Viewer';
      case Flavor.wire:
        return 'The Wire Character Viewer';
      default:
        return 'title';
    }
  }
  static String get BASE_URL {
    switch (appFlavor) {
      case Flavor.simpsons:
        return 'http://api.duckduckgo.com/?q=simpsons+characters&format=json';
      case Flavor.wire:
        return 'http://api.duckduckgo.com/?q=the+wire+characters&format=json';
      default:
        return 'title';
    }
  }

}
