class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants? get instance {
    _instace ??= ImageConstants._init();
    return _instace;
  }

  ImageConstants._init();

  // String get backGroundStart => toPng('backGroundStart');

  String toPng(String name) => 'assets/images/$name.png';
}