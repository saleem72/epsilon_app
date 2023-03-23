//

abstract class ApiHelper {
  Future get({
    required String url,
    required String endPoint,
    Map<String, String> headers,
    Map<String, String> params,
    bool printResult,
  });
  Future post({
    required String url,
    required String endPoint,
    Map<String, String>? body,
    Map<String, String> headers,
    Map<String, String> params,
    required bool printResult,
  });
}
