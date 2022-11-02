class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants? get instance {
    _instance ??= ImageConstants._init();
    return _instance;
  }

  ImageConstants._init();

  String get emptyImage => toPng('emptyImage');
  String get backGround => toPng('c7');

  String toPng(String name) => 'assets/images/$name.png';
}