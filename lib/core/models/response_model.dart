import 'dart:convert';

import 'package:http/http.dart';

class ResponseModel {
  final bool success;
  final int statusCode;
  final String? message;
  final dynamic data;
  const ResponseModel(
      {this.data,
      this.message,
      required this.statusCode,
      required this.success});

  factory ResponseModel.fromResponse(Response response) {
    final body = jsonDecode(response.body);

    return ResponseModel(
        success: body['success'],
        statusCode: body['statusCode'],
        data: body['data'],
        message: body['message']);
  }
}