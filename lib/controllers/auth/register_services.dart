import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ridehailing_passenger/models/auth/register_models.dart';

class RegisterService {
  final String baseUrl = 'http://188.166.179.146:8000/api';

  Future<RegisterResponse> registerUser(RegisterRequest request) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register/user'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request.toJson()),
      );

      final responseData = jsonDecode(response.body);
      return RegisterResponse.fromJson(responseData);
    } catch (e) {
      return RegisterResponse(
        success: false,
        message: 'Terjadi kesalahan: ${e.toString()}',
      );
    }
  }
}