import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApiClient {
  static Future<http.Response> loginUser(String email, String password) async {
    final Uri url = Uri.parse(
        "https://peanut.ifxdb.com/api/ClientCabinetBasic/IsAccountCredentialsCorrect");

    final Map<String, String> headers = {
      "accept": "*/*",
      "Content-Type": "application/json-patch+json",
    };

    final Map<String, dynamic> body = {
      "login": email,
      "password": password,
    };

    try {
      final response =
          await http.post(url, headers: headers, body: jsonEncode(body));
      return response;
    } catch (e) {
      // network errors or exceptions
      return http.Response(e.toString(),500);
    }
  }
}
