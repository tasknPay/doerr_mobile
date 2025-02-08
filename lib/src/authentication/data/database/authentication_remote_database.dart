import 'dart:convert';

import 'package:doerr/core/doer/domain/entities/doer.dart';
import 'package:http/http.dart' as http;

import '../../../../shared/data/endpoints.dart';

abstract class AuthenticationRemoteDatabase {
  Future<Doer> login(String email, String password);
  Future<Doer> logout();
  Future<bool> validateToken(String token);
  Future<Doer> register(Doer doer);
}

class AuthenticationRemoteDatabaseImpl implements AuthenticationRemoteDatabase {
  @override
  Future<Doer> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${EndPoints.baseUrl}/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200 && data['status'] == 'success') {
      return Doer(
        name: '${data['user']['firstname']} ${data['user']['lastname']}',
        email: data['user']['email'],
        phone: data['user']['id'],
        token: data['token'],
      );
    } else {
      throw Exception(data['message'] ?? 'Failed to login');
    }
  }

  @override
  Future<Doer> logout() async {
    final response = await http.post(
      Uri.parse('${EndPoints.baseUrl}/logout'),
    );

    // Treat 302 redirect as a successful logout
    if (response.statusCode == 200 || response.statusCode == 302) {
      return Doer.initial();
    }

    throw Exception(
      'Failed to logout. Status code: ${response.statusCode}, body: ${response.body}',
    );
  }

  @override
  Future<bool> validateToken(String token) async {
    final response = await http.get(
      Uri.parse('${EndPoints.baseUrl}/services'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return response.statusCode == 200;
  }

  @override
  Future<Doer> register(Doer doer) async {
    final response = await http.post(
      Uri.parse('${EndPoints.baseUrl}/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': doer.name,
        'email': doer.email,
        'phone': doer.phone,
        'password': doer.password,
      }),
    );
    final data = json.decode(response.body);
    if (response.statusCode == 200 && data['status'] == 'success') {
      return Doer(
        name: '${data['user']['firstname']} ${data['user']['lastname']}',
        email: data['user']['email'],
        phone: data['user']['id'],
        token: data['token'],
      );
    } else {
      throw Exception(data['message'] ?? 'Failed to register');
    }
  }
}
