

import 'package:dio/dio.dart';

class BaseService {
  final httpdio = Dio();
  String authtoken;

  BaseService(this.authtoken) {
    httpdio.options.contentType = Headers.jsonContentType;
  }

}