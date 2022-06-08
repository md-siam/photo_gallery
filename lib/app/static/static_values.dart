class StaticValues {
  /// Max width for a small layout.
  static const double mobileBreakPointWidth = 576;
  /// Max width for a medium layout.
  static const double tabletBreakPointWidth = 1200;
  /// Max width for a large layout.
  static const double desktopBreakPointWidth = 1440;

  /// For APIs
  static const String apiUrl = 'https://api.unsplash.com/';
  static const String clientId = '7VyxP-oqEk5W2UG87t9VBD9UlkNsA8adiZjKlqdWNg8';
  static const String count = '30';
  static const String query = 'london';

  static const String singlePhotoUrl =
      'https://api.unsplash.com/photos/m3JzVzNadfE/?client_id=$clientId';

  static const String singleRandomPhotoUrl =
      'https://api.unsplash.com/photos/random/?client_id=$clientId';

  static const String listOf10PhotosUrl =
      'https://api.unsplash.com/photos/?client_id=$clientId';

  static const String listOfRandom30PhotosUrl =
      'https://api.unsplash.com/photos/random/?client_id=$clientId&count=$count';

  static const String queryOfPhotoList =
      'https://api.unsplash.com/search/photos?query=$query&client_id=$clientId';
}
