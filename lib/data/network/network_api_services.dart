import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/data/response/parser.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_mvvm/data/app_exceptions.dart';
import 'package:flutter_mvvm/data/network/base_api_services.dart';

Duration apiTimeOut = const Duration(seconds: 300);

class NetworkApiService extends BaseApiServices {
  @override
  Future<Either<AppException, Q>> callGetApi<Q, R>(String url,
      Map<String, String> headers, ComputeCallback<String, R> callback,
      {Map<String, dynamic>? query}) async {
    try {
      if (query != null) {
        String queryString = Uri(queryParameters: query).query;
        url = "$url?$queryString";
      }

      if (kDebugMode) {
        print('apiURL : $url');
        print('headers : ${jsonEncode(headers)}');
      }
      var uri = Uri.parse(url);
      http.Response response =
          await http.get(uri, headers: headers).timeout(Duration(seconds: 10));
      if (response != null) {
        return Parser.parseResponse(response, callback);
      }
      return Left(UnknownError());
    } on SocketException {
      return Left(NoInternetError());
    } on TimeoutException {
      return Left(TimeoutError());
    } on HandshakeError {
      return Left(HandshakeError());
    }
  }

  @override
  Future<Either<AppException, Q>> callPostApi<Q, R>(String url,
      Map<String, String> headers, ComputeCallback<String, R> callback,
      {body}) async {
    try {
      var uri = Uri.parse(url);
      if (kDebugMode) {
        print('apiURL : $url');
        print('headers : ${jsonEncode(headers)}');
        print('body : ${jsonEncode(body)}');
      }
      http.Response response =
          await http.post(uri, body: body).timeout(apiTimeOut);
      if (response != null) {
        return Parser.parseResponse(response, callback);
      }
      return Left(UnknownError());
    } on SocketException {
      return Left(NoInternetError());
    } on TimeoutException {
      return Left(TimeoutError());
    } on HandshakeError {
      return Left(HandshakeError());
    }
  }
}
