//
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../errors/exceptions/app_exceptions.dart';
import '../domain/api_helper.dart';

class HttpApiHelper implements ApiHelper {
  final http.Client client;

  HttpApiHelper({required this.client});

  @override
  Future get({
    required String url,
    required String endPoint,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    bool printResult = false,
  }) async {
    Future<http.Response> request;
    try {
      final uri = Uri.parse(url + endPoint).replace(queryParameters: params);

      if (headers != null) {
        request = client.get(uri, headers: headers);
      } else {
        request = client.get(uri);
      }
      final response = await request;
      if (printResult) {
        _printResponse(response);
      }
      return _returnResponse(response);
    } catch (e) {
      _rethrowExceptions(e);
    }
  }

  @override
  Future post({
    required String url,
    required String endPoint,
    Map<String, String>? body,
    Map<String, String>? headers,
    Map<String, String>? params,
    bool printResult = false,
  }) async {
    Future<http.Response> request;
    try {
      final uri = Uri.parse(url + endPoint).replace(queryParameters: params);

      if (headers != null) {
        request = client.post(uri, headers: headers, body: body);
      } else {
        request = client.post(uri, body: body);
      }

      final response = await request;
      if (printResult) {
        _printResponse(response);
      }
      return _returnResponse(response);
    } catch (e) {
      _rethrowExceptions(e);
    }
  }

  _rethrowExceptions(error) {
    if (error is SocketException) {
      throw const ConnectionException('No Internet connection');
    }
    if (error is TimeoutException) {
      throw const ConnectionException('No Internet connection');
    }
    if (error is FormatException) {
      throw const DecodingException('Fail to decode data');
    }
    if (error is TypeError) {
      throw const DecodingException('Fail to decode data');
    }
    if (error is BadRequestException) {
      throw error;
    }
    if (error is BadResponseException) {
      throw error;
    }
    if (error is UnauthorisedException) {
      throw error;
    }
    if (error is ServerException) {
      throw error;
    }
    if (error is NotExsitsRouteException) {
      throw error;
    }
    throw UnExpectedException(error.toString());
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw const ServerException('');
      default:
        var responseJson = json.decode(response.body);
        return responseJson;
    }
  }

  _printResponse(http.Response response) {
    var temp = utf8.decode(response.bodyBytes);
    debugPrint(temp.toString());
  }
}

/*

      case 200:
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;

      case 400:
        var responseJson = json.decode(response.body);
        return responseJson;
      // throw BadRequestException(response.body.toString());

      case 404:
        var responseJson = json.decode(response.body);
        return responseJson;
      // throw NotExsitsRouteException(response.body.toString());
      default:
        throw UnExpectedException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
*/