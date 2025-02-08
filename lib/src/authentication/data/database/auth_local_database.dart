import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDatabase {
  Future<void> saveToken(String token);
  Future<void> saveIsAdmin(int isAdmin);
  Future<String?> getToken();
  Future<int?> getIsAdmin();
  Future<void> removeToken();
  Future<void> removeIsAdmin();
  Future<void> clearAllData();
}

class AuthLocalDatabaseImpl implements AuthLocalDatabase {
  static const String _tokenKey = 'auth_token';
  static const String _isAdminKey = 'is_admin';

  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  @override
  Future<void> saveIsAdmin(int isAdmin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_isAdminKey, isAdmin);
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  @override
  Future<int?> getIsAdmin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_isAdminKey);
  }

  @override
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  @override
  Future<void> removeIsAdmin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isAdminKey);
  }

  @override
  Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
