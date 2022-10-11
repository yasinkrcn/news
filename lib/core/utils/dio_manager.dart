import 'package:dio/dio.dart';

class DioManager {
  static Dio getDio() {
    Dio dio = Dio();

    dio.options.baseUrl = 'https://newsapi.org/';
    dio.options.queryParameters = {
      'apiKey': 'd81af8ec02164ca28a61176abdf65fc5',
      // 'apiKey': 'aecf1d77da4342518f249c8e7c692100',
      // 'apiKey': 'bcccb776f37e4a699c36ce0a4939c95f',
      // 'apiKey': 'ecb65575edc449419a70612b6e093a2d',
      // 'apiKey': '1a6b35171765474db053de666f2fd1ca',
      // 'apiKey': 'd9df1b8914104f0ca093ba5c5817bb97',
      // 'apiKey': '78fc3e6fb7164695afb059af02d801ab',
      // 'apiKey': 'd64e95b7749f42c9a5a4a5a7fb05747d',
      // 'apiKey': 'd81af8ec02164ca28a61176abdf65fc5',
    };
    dio.options.headers = {
      'Accept': 'application/json',
    };
    dio.options.contentType = 'application/json';

    dio.options.responseType = ResponseType.plain;



    return dio;
  }
}


