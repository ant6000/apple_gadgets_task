import 'package:http/http.dart' as http;

class ProfileRepo {
  static Future<http.Response> getProfileInfo(
      String apiEndpoint, String login, String token) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://peanut.ifxdb.com/api/ClientCabinetBasic/$apiEndpoint'),
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json-patch+json',
        },
        body:
            '{"login":$login,"token":"$token"}',
      );
      return response;
    } catch (e) {
      print('Error fetching trades: $e');
      return http.Response(e.toString(), 500);
    }
  }
}
