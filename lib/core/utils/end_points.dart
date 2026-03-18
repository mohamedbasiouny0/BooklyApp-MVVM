class EndPoints {
  static const String _apiKey = 'd25739486b464e1281669525f6015afd';
  static const String featuredEndPoint =
      'search-books?query=programming&api-key=$_apiKey';
  static const String newestEndPoint =
      'search-books?sort=publish-date&query=programming&api-key=$_apiKey';
  static const String searchEndPoint = 'search-books?&api-key=$_apiKey&query=';
  static const String similarEndPoint = '/similar?number=10&api-key=$_apiKey';
}
