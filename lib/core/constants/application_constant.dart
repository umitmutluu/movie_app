
class ApplicationConstants {
  static ApplicationConstants? _instance;

  static ApplicationConstants get instance {
    _instance = ApplicationConstants._init();
    return _instance??instance;
  }

  ApplicationConstants._init();

  Map<String, String> get headersJson => {"Content-Type": "application/json"};

  String get apiKey => "?api_key=35ef0461fc4557cf1d256d3335ed7545";
  String get baseUrl => "https://api.themoviedb.org/3/";
  String get imageBaseUrl => "https://image.tmdb.org/t/p/w500";

}