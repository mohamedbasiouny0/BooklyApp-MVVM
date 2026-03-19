class EndPoints {
  static const String _apiKey = '5f666f0f56b8471c9e133ad0d204cae8';
  static const String featuredEndPoint =
      'search-books?number=100&query=programming&api-key=$_apiKey';
  static const String newestEndPoint =
      'search-books?number=100&sort=publish-date&query=programming&api-key=$_apiKey';
  static String getBookInfoEndPoint({required int id}) {
    return '$id?number=100&api-key=$_apiKey';
  }

  static const String searchEndPoint = 'search-books?&api-key=$_apiKey&query=';
  static String similarEndPoint({required int id}) {
    return '$id/similar?number=10&api-key=$_apiKey';
  }
}
