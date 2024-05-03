// ignore_for_file: unnecessary_null_comparison, always_declare_return_types, deprecated_member_use, prefer_const_constructors

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_app/helpers/cash_helper.dart';
import 'package:news_app/helpers/prefs_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String staging = 'https://staging.sa/api/';
const String production = 'https://backend.sa/api/';
// const String baseUrl = 'https://api.npoint.io/43427003d33f1f6b51cc';
const String baseUrl = 'https://newsapi.org/v2/';

class NetworkService {
  final PrefsService _prefsService;

  NetworkService({
    required PrefsService prefsService,
  }) : _prefsService = prefsService {
    _init();
  }

  late final Dio dio;

  void _init() {
    final options = BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);

    final logger = LogInterceptor(
      responseHeader: false,
      responseBody: true,
      requestBody: true,
    );

    final authExpiration = InterceptorsWrapper(
      onError: (e, handler) async {
        if (e.response?.statusCode == HttpStatus.unauthorized) {
          await CashedHelper.setUserToken('');
          // AppRouter.i.refresh();
          return handler.next(e);
        }
        return handler.next(e);
      },
    );

    dio.interceptors.add(logger);
    dio.interceptors.add(authExpiration);
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    bool token = false,
    bool queue = true,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
      options: Options(headers: {
        if (token) 'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
        'lang': _prefsService.locale.get(),
      }),
    );
  }

  // Future<Response?> getData({
  //   path,
  //   queryParameters,
  // }) async {
  //   try {
  //     return await dio!.get(path,
  //         queryParameters: queryParameters,
  //         options: Options(
  //             validateStatus: (_) => true,
  //             headers: CashedHelper.getUserToken() != null ||
  //                     CashedHelper.getUserToken() != ''
  //                 ? {
  //                     'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
  //                     'Accept': 'application/json',
  //                     'lang': CashedHelper.getLang()
  //                   }
  //                 : {'lang': CashedHelper.getLang()}));
  //   } on SocketException catch (e) {
  //     log(e.message);
  //     customToast(e.message);
  //   } on DioError catch (e) {
  //     log(e.message.toString());
  //     String errorMsg = _handleResponse(e.response!);
  //     customToast(errorMsg);
  //   }
  //   return null;
  // }

  // static Future<Response?> postData(
  //     {path, data, bool showError = false}) async {
  //   try {
  //     return await dio!.post(path,
  //         data: data,
  //         options: Options(
  //           contentType: 'application/json',
  //           headers: CashedHelper.getUserToken() != null ||
  //                   CashedHelper.getUserToken() != ''
  //               ? {
  //                   'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
  //                   'Accept': 'application/json',
  //                   'lang': CashedHelper.getLang()
  //                 }
  //               : {'lang': CashedHelper.getLang()},
  //           followRedirects: false,
  //         ));
  //   } on SocketException catch (e) {
  //     log(e.message);
  //     customToast(e.message);
  //   } on DioError catch (e) {
  //     customToast(e.response!.data['msg'].toString());
  //   }
  //   return null;
  // }

  // static Future<Response?> deleteRequest({
  //   path,
  //   queryParameters,
  // }) async {
  //   try {
  //     return await dio!.delete(path,
  //         queryParameters: queryParameters,
  //         options: Options(
  //             validateStatus: (_) => true,
  //             headers: CashedHelper.getUserToken() != null ||
  //                     CashedHelper.getUserToken() != ''
  //                 ? {
  //                     'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
  //                     'Accept': 'application/json',
  //                     'lang': CashedHelper.getLang()
  //                   }
  //                 : {'lang': CashedHelper.getLang()}));
  //   } on SocketException catch (e) {
  //     log(e.message);
  //     customToast(e.message);
  //   } on DioError catch (e) {
  //     log(e.message.toString());
  //     String errorMsg = _handleResponse(e.response!);
  //     customToast(errorMsg);
  //   }
  //   return null;
  // }

  // static Future<Response?> patchRequest({
  //   path,
  //   queryParameters,
  // }) async {
  //   try {
  //     return await dio!.patch(path,
  //         queryParameters: queryParameters,
  //         options: Options(
  //             validateStatus: (_) => true,
  //             headers: CashedHelper.getUserToken() != null ||
  //                     CashedHelper.getUserToken() != ''
  //                 ? {
  //                     'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
  //                     'Accept': 'application/json',
  //                     'lang': CashedHelper.getLang()
  //                   }
  //                 : {'lang': CashedHelper.getLang()}));
  //   } on SocketException catch (e) {
  //     log(e.message);
  //     customToast(e.message);
  //   } on DioError catch (e) {
  //     log(e.message.toString());
  //     String errorMsg = _handleResponse(e.response!);
  //     customToast(errorMsg);
  //   }
  //   return null;
  // }

  // static Future<Response?> putRequest({
  //   path,
  //   data,
  //   queryParameters,
  // }) async {
  //   try {
  //     return await dio!.put(path,
  //         queryParameters: queryParameters,
  //         data: data,
  //         options: Options(
  //             validateStatus: (_) => true,
  //             headers: CashedHelper.getUserToken() != null ||
  //                     CashedHelper.getUserToken() != ''
  //                 ? {
  //                     'Authorization': 'Bearer ${CashedHelper.getUserToken()}',
  //                     'Accept': 'application/json',
  //                     'lang': CashedHelper.getLang()
  //                   }
  //                 : {'lang': CashedHelper.getLang()}));
  //   } on SocketException catch (e) {
  //     log(e.message);
  //     customToast(e.message);
  //   } on DioError catch (e) {
  //     log(e.message.toString());
  //     String errorMsg = _handleResponse(e.response!);
  //     customToast(errorMsg);
  //   }
  //   return null;
  // }

  // static String _handleResponse(Response response) {
  //   if (response == null) {
  //     var jsonResponse = 'connection error';
  //     return jsonResponse;
  //   }
  //   switch (response.statusCode) {
  //     case 400:
  //       var jsonResponse = 'UnAuth';
  //       return jsonResponse;
  //     case 401:
  //       var jsonResponse = 'UnAuth';
  //       return jsonResponse;
  //     case 403:
  //       var jsonResponse = 'UnAuth';
  //       return jsonResponse;
  //     case 404:
  //       var jsonResponse = 'Not found';
  //       return jsonResponse;
  //     case 405:
  //       var jsonResponse = 'post request replaced by get request';
  //       return jsonResponse;
  //     case 422:
  //       var jsonResponse = 'some fileds required! or error with entry data';
  //       return jsonResponse;
  //     case 500:
  //       var jsonResponse = 'server error';
  //       return jsonResponse;
  //     default:
  //       var jsonResponse = 'server error';
  //       return jsonResponse;
  //   }
  // }
}
