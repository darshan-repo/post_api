import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:post_api/post_model.dart';

class NetworkApi {
  static Future<LogInResponse> sendData(LogInRequest req) async {
    var response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: logInRequestToJson(req),
    );
    if (response.statusCode == 201) {
      return LogInResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Unable To load Api');
    }
  }

  static Future<List<LogInRequest>> fetchData() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      return logInReqFromJson(response.body);
    } else {
      throw Exception('Unable to load Api');
    }
  }
}
