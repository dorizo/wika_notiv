import 'package:shared_preferences/shared_preferences.dart';

class Session {
  Future<SharedPreferences> _session = SharedPreferences.getInstance();
  Future<void> setuser(String userjson) async {
    final SharedPreferences sessionv = await _session;
    sessionv.setString("users_erp", userjson);
  }

  Future<String> sessionku() async {
    final SharedPreferences sessionv = await _session;
    return sessionv.getString('users_erp');
  }

  Future<void> settoken(String token) async {
    final SharedPreferences sessionv = await _session;
    sessionv.setString("token", token);
  }

  Future<String> gettoken() async {
    final SharedPreferences sessionv = await _session;
    return sessionv.getString('token');
  }

  Future<void> setpassword(String token) async {
    final SharedPreferences sessionv = await _session;
    sessionv.setString("password", token);
  }

  Future<String> getpassword() async {
    final SharedPreferences sessionv = await _session;
    return sessionv.getString('password');
  }

  Future<String> logout() async {
    final SharedPreferences sessionv = await _session;
    sessionv.clear();
    return "logout";
  }
}
