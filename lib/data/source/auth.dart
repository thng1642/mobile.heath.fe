import 'dart:convert';

import 'package:http/http.dart' as http;

abstract interface class DataAuthSource {
  Future<bool> login(String username, String password);
}

class RemoteAuthSource implements DataAuthSource {
  @override
  Future<bool> login(username, password) async {
    const url = 'http://10.0.2.2:5050/api/auth/login';
    final response = await http.Client().post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      return true;
    }
    return false;
  }
}
