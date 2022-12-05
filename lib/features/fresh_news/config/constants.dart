class ConstantsNews {
  static String topHeadlinesUrl = 'https://newsapi.org/v2/top-headlines?country=tr&apiKey=3c2d03ce725945eeaebbf59b67596a72';
  static String newsFilteredUrl(String keyword) => 'https://newsapi.org/v2/everything?q=$keyword&apiKey=3c2d03ce725945eeaebbf59b67596a72';
}
