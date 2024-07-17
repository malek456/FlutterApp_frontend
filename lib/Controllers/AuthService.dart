import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/data.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late String retrevedToken='';

  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    User? user = _auth.currentUser;
    return isLoggedIn || user != null;
  }


  Future<bool> loginUser(String email, String password) async {
    print('Attempting login for email: $email');
    final url = Uri.parse('$baseUrl/auth/login');

    try {
      final body = jsonEncode({
        'email': email,
        'password': password,
      });

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {


        final data = jsonDecode(response.body);
        if (data['status'] == 'error') {
          print('Login failed: ${data['message']}');
          return false;
        } else {
          final user = data['user'];
          final token = user['token'];
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('authToken', token);
          await prefs.setBool('isLoggedIn', true);
          //await prefs.setString('user', user);
          print('Login successful. Toooooken: $token');
          print('Login successful: $data');
          return true;
        }
      } else {
        print('Login failed: ${response.statusCode}');
        print('Error: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
  String retreiveToken(String token){
    return retrevedToken;
  }

  Future<bool> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signInSilently();
      print('Google User: $googleUser');

      if (googleUser == null) {
        googleUser = await _googleSignIn.signIn();
      }
      print('Google Userr: $googleUser');

      if (googleUser != null) {
        print('google userrr: $googleUser');
        await sendUserDataToBackend(googleUser);
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in with Firebase Authentication
        UserCredential userCredential = await _auth.signInWithCredential(credential);

        // Send user data to backend
        //await sendUserDataToBackend(userCredential.user!);

        return true;
      } else {
        throw Exception('Google sign-in canceled or failed.');
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      return false;
      // Handle errors as needed
    }
    return false;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Future<void> sendUserDataToBackend(GoogleSignInAccount user) async {
    final url = Uri.parse('$baseUrl/auth/login/google');
    try {
      // Prepare user data to send
      var userData = {
        'password': user.id,
        'firstName': user.displayName,
        'email': user.email,
        // Add more fields as needed
      };

      print('user data : $userData' );

      // Send user data to backend
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        print('User data sent to backend successfully');
      } else {
        throw Exception('Failed to send user data to backend');
      }
    } catch (e) {
      print('Error sending user data to backend: $e');
      // Handle error
    }
  }
}
