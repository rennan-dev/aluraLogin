import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'http_interceptors.dart';

class WebClient {
  static const String url = "http://192.168.80.107:3000/";

  http.Client client = InterceptedClient.build(interceptors: [LoggerInterceptor()], requestTimeout: const Duration(seconds: 5));
}