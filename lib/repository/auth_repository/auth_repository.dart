import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  AuthRepository();

  Future<String?> authenticate(String username, String password) async {
    final Uri url = Uri.parse(
        'http://127.0.0.1:8000/auth/token/login'); // Replace with your authentication endpoint

    try {
      final response = await http.post(
        url,
        body: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final String token = data['auth_token'];
        return token;
      } else {
        throw Exception(
            'Failed to authenticate. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Exception during authentication: $e');
    }
  }
}
