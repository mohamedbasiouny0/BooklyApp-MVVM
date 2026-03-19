class EndPoints {
  static const String _apiKey = 'd25739486b464e1281669525f6015afd';
  static const String featuredEndPoint =
      'search-books?number=100&query=programming&api-key=$_apiKey';
  static const String newestEndPoint =
      'search-books?number=100&sort=publish-date&query=programming&api-key=$_apiKey';
  static String getBookInfoEndPoint({required int id}) {
    return '$id?number=100&api-key=$_apiKey';
  }

  static String searchEndPoint({required String q}) {
    return 'search-books?&api-key=$_apiKey&query=$q';
  }

  static String similarEndPoint({required int id}) {
    return '$id/similar?number=10&api-key=$_apiKey';
  }
}
