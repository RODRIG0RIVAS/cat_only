class Endpoints {
  Endpoints._();

  static String base = 'https://api.thecatapi.com/';

  static String fromPaginationAndLimit(int page, int limit) {
    return '${base}v1/images/search?limit=$limit&pagination=$page';
  }
}
