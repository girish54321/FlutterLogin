import 'dart:convert';

ErrorLogin errorLoginFromJson(String str) => ErrorLogin.fromJson(json.decode(str));

String errorLoginToJson(ErrorLogin data) => json.encode(data.toJson());

class ErrorLogin {
  String error;

  ErrorLogin({
    this.error,
  });

  factory ErrorLogin.fromJson(Map<String, dynamic> json) => ErrorLogin(
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
  };
}
