import 'package:http/http.dart' as http;

class FetchTradesRepo {
  static Future<http.Response> fetchTrades(String token) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://peanut.ifxdb.com/api/ClientCabinetBasic/GetOpenTrades'),
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json-patch+json',
        },
        body:
            '{"login":2088888,"token":"$token"}',
      );
      return response;
    } catch (e) {
      print('Error fetching trades: $e');
      return http.Response(e.toString(), 500);
    }
  }
}
