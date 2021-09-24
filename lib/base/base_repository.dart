import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_architecture/utils/api_constants.dart';


class BaseRepository{

  late Dio _dio;
  late Dio _postDio;
  BaseRepository(){
    _postDio = Dio(BaseOptions(
      baseUrl: 'jsonplaceholder.typicode.com',
      connectTimeout: 50000,
      receiveTimeout: 50000,
      headers: {
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "GET,POST, OPTIONS"
      },
    ));
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.BASE_URL,
      connectTimeout: 50000,
      receiveTimeout: 50000,
      headers: {
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "GET,POST, OPTIONS"
      },
    ));

    initInterceptor();
  }

 Dio getDio() => _dio;
 Dio getPostDio() => _postDio;

  initInterceptor(){
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest:(options, handler){
          // Do something before request is sent
          return handler.next(options); //continue
        },
        onResponse:(response,handler) {
          // Do something with response data
         // log("Response: "+response.data.toString());

          return handler.next(response); // continue
        },
        onError: (DioError e, handler) {
          // Do something with response error
          return  handler.next(e);//continue
        }
    ));

    _dio.interceptors.add(LogInterceptor(request: true, requestHeader: true, requestBody: true, responseBody: true, error: true));
  }
}