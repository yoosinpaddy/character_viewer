enum Flavor {
  simpsons,
  wire,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

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

}
