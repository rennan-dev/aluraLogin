import 'dart:developer';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends InterceptorContract {
  Logger logger = Logger();

  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    //print('----- Request -----');
    logger.t("Requisição para ${request.url}\nCabeçalhos: ${request.headers}\nCorpo: ${request.toString()}");
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    log('----- Response -----');
    logger.i("Base Request para ${response.request}\nCabeçalhos: ${response.headers}\nCorpo: ${response.toString()}");
    log('Code: ${response.statusCode}');
    if (response is Response) {
      log((response).body);
    }
    return response;
  }
}