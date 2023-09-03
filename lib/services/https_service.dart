import 'package:http/http.dart' as http;

class HttpService {
  // static const String baseUrl = 'http://192.168.1.103:8000/';
  static const String baseUrl = 'https://sari9888gb.pythonanywhere.com/';

  static Future<T> parsedPost<T>({
    required String endPoint,
    Map<String, dynamic>? body,
    required T Function(String response) mapper,
  }) async {
    return mapper(
      await rawPost(
        endPoint: endPoint,
        body: body,
      ),
    );
  }

  static Future<String> rawPost({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    body = body?.map<String, String>(
      (key, value) => MapEntry(
        key,
        value.toString(),
      ),
    );
    String fullURL = baseUrl + endPoint;
    http.Response response = await http.post(
      Uri.parse(
        fullURL,
      ),
      body: body,
    );
    String rawResponse = response.body;
    return rawResponse;
  }

  static Future<String> rawGet({
    required String endPoint,
    Map<String, String>? queryParams,
  }) async {
    String fullURL = baseUrl + endPoint;
    http.Response response = await http.get(
      Uri.parse(
        //TODO: Rethink this
        // '$fullURL?format=json${queryParams?.keys.map((e) => '$e=${queryParams[e]}').join('&&')}',
        '$fullURL?format=json',
      ),
    );
    String rawResponse = response.body;
    return rawResponse;
  }

  static Future<T> parsedGet<T>({
    required String endPoint,
    Map<String, String>? queryParams,
    required T Function(String response) mapper,
  }) async {
    String rawResponse = await rawGet(
      endPoint: endPoint,
      queryParams: queryParams,
    );
    print(rawResponse);
    return mapper(rawResponse);
  }
}
