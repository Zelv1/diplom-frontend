import 'dart:convert';
import 'dart:io';
import 'package:diplomversec/bloc/auth_bloc/auth_bloc.dart';
import 'package:diplomversec/repository/verification_repository/model/user_model.dart';
import 'package:http/http.dart' as http;

class VerificationRepository {
  VerificationRepository();

  Future<UserModel> verificate(String token) async {
    final Uri url = Uri.parse(
        'http://127.0.0.1:8000/auth/users/me'); // Replace with your authentication endpoint

    try {
      final response = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: 'Token $token'});

      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
        return UserModel.fromJson(responseJson);
      } else {
        throw Exception(
            'Failed to authenticate. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Exception during authentication: $e');
    }
  }
}
