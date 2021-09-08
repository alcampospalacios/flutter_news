import 'package:dio/dio.dart';

class DioManager {
  // final String base_url;
  // final String endpoint;

  // DioManager(this.base_url, this.endpoint);

  // Methods
  Future<dynamic> getHttp(base_url, endpoint) async {
    Response response;
    try {
      response = await Dio().get('$base_url/$endpoint');
      return response;
    } catch (e) {
      print(e);
    }

    return;
  }
}
