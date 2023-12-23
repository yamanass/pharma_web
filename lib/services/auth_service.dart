import 'package:http/http.dart' as http;
import 'package:pharma_web/models/auth/login.dart';


import 'dart:convert';


class AuthServices {


  Future<LoginModel> getUser(LoginModel login) async {
    final url = Uri.parse("http://127.0.0.1:8000/api/admin/login");
    print(login.toJson());
    final response = await http.post(
      url,
      headers: <String, String>{
        'Accept': 'application/json',
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
        'Content-Type': 'application/json',
      },
      body: json.encode(login.toJson()),
    );
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      return LoginModel.fromJson(
          jsonDecode(response.body)["data"] as Map<String, dynamic>);
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create user.');
    }
  }

  Future<int> deleteToken(String token) async {
    final url = "http://127.0.0.1:8000/api/admin/logout";
    final response = await http.post(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to logout');
    }
  }
}

