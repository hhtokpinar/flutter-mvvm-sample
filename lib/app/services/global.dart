import '../utils/app_packages.dart';

class WebServiceGlobal {
  static Future<dynamic> fetchData(String url) async {
    final response = await AppPackages.dio.get(url);
    // Status 200 OK
    if (response.statusCode == 200) {
      return response.data;
    } else {
      //return <NewsArticle>[];
      throw Exception('fetchData failed. Status code: ${response.statusCode}, message: ${response.statusMessage}');
    }
  }

  static Future<dynamic> post(String path, {required dynamic data}) async {
    final response = await AppPackages.dio.post(path, data: data);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      //return <NewsArticle>[];
      throw Exception('fetchData failed. Status code: ${response.statusCode}, message: ${response.statusMessage}');
    }
  }
}
