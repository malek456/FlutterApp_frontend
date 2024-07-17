import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/data.dart';


class Registeruser {


  Future<void> registerUser(String email, String password, String firstName, String lastName, String phone) async {
    print('Entering registerUser function');
    final url = Uri.parse('http://192.168.1.95:5000/api/auth/register');
    print('URL formed: $url');
    final username = '${firstName.toLowerCase()}.${lastName.toLowerCase()}';
    const String role="etudiant";


    final body = jsonEncode({
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'username': username,
      'role': role,
    });
    print('Request body formed: $body');

    try {
      print('Starting HTTP POST request for registration');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );
      print('HTTP POST request complete for registration');

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print('Registration successful: $data');
      } else {
        print('Registration failed: ${response.statusCode}');
        print('Error: ${response.body}');
      }
    } catch (e) {
      print('Exception caught: $e');
    }
  }


}
