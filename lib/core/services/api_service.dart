import 'dart:convert';

import 'package:flutter_template/core/models/models.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final Uri baseUrl = Uri.parse('https://google.com');

  final Map<String, String> header = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };

  Future<ResponseModel> post({Map<String, dynamic>? body}) async {
    final response =
        await http.post(baseUrl, body: jsonEncode(body), headers: header);
    return ResponseModel.fromResponse(response);
  }
}
