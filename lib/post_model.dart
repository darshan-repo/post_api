import 'dart:convert';

String logInRequestToJson(LogInRequest data) => json.encode(data.toJson());
// LogInRequest logInReqFromJson(String str) =>
//     LogInRequest.fromJson(json.decode(str));

List<LogInRequest> logInReqFromJson(String str) => List<LogInRequest>.from(
    json.decode(str).map((x) => LogInRequest.fromJson(x)));

class LogInRequest {
  int userId;
  String title;
  String body;

  LogInRequest({
    required this.userId,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "title": title,
        "body": body,
      };

  factory LogInRequest.fromJson(Map<String, dynamic> json) => LogInRequest(
        body: json['body'],
        title: json['title'],
        userId: json['userId'],
      );
}

class LogInResponse {
  int id;

  LogInResponse({
    required this.id,
  });

  factory LogInResponse.fromJson(Map<String, dynamic> json) => LogInResponse(
        id: json["id"],
      );
}
