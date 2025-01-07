import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _secureStorage = FlutterSecureStorage();

  static Future<void> storeToken(String token) async {
    await _secureStorage.write(key: 'auth_token', value: 'Bearer $token');
  }

  static Future<String?> getToken() async {
    return await _secureStorage.read(key: 'auth_token');
  }

  static Future<void> clearToken() async {
    await _secureStorage.delete(key: 'auth_token');
  }
}
