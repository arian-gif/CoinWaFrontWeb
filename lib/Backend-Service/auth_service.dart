import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login-Logout/home_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:jwt_decoder/jwt_decoder.dart';
import '../Questionaire/answer_model.dart';

class AuthService {
  final _storage = const FlutterSecureStorage();
  final String baseUrl =
      kIsWeb ? 'http://localhost:3000/api' : 'http://10.0.2.2:3000/api';


  Future<bool> isTokenValid() async {
    final token = await getToken();
    if (token == null) {
      return false;
    }
    return !JwtDecoder.isExpired(token);
  }

  Future<void> _checkTokenAndNavigate(BuildContext context) async {
    final isValid = await isTokenValid();
    if (!isValid) {
      // Navigate to the login screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    email = email.toLowerCase(); // Convert to lowercase
    print("Login Request: Email = $email, Password = $password");  // Log the request

    final url = Uri.parse('$baseUrl/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];
      await _storage.write(key: 'user_token', value: token);
      return data;
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }


  Future<void> logout() async {
    final token = await getToken();
    if (token == null) {
      throw Exception('No token available');
    }
    final response = await http.post(
      Uri.parse('$baseUrl/auth/logout'),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': token,
      },
    );

    if (response.statusCode == 200) {
      await _storage.delete(key: 'user_token');
      return json.decode(response.body);
    } else {
      throw Exception('Failed to logout');
    }
  }

  Future<Map<String, dynamic>> register(String fullname, String birthday,
      String username, String email, String password) async {
    email = email.toLowerCase();
    final url = Uri.parse('$baseUrl/auth/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fullname': fullname,
        'birthday': birthday,
        'username': username,
        'email': email,
        'password': password
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data; // Do not store token here
    } else {
      final errorMsg = json.decode(response.body)['msg'];
      throw Exception('Failed to register: $errorMsg');
    }
  }


  Future<Map<String, dynamic>> verifyEmail(String email, String code) async {
    email = email.toLowerCase();
    final url = Uri.parse('$baseUrl/auth/verify-email');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'code': code}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Store the token here after email verification
      final token = data['token'];
      if (token != null) {
        await _storage.write(key: 'user_token', value: token);
      }

      return data;
    } else {
      final errorMsg = json.decode(response.body)['msg'];
      throw Exception('Failed to verify email: $errorMsg');
    }
  }


  Future<String?> getToken() async {
    return await _storage.read(key: 'user_token');
  }

  Future<http.Response> getUserProfile(BuildContext context) async {
    await _checkTokenAndNavigate(context);
    final token = await getToken();
    if (token == null) {
      throw Exception('No token available');
    }
    final response = await http.get(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': token,
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch user profile: ${response.body}');
    }
  }

  Future<http.Response> getEveryID(BuildContext context) async {
    await _checkTokenAndNavigate(context);
    final token = await getToken();
    if (token == null) {
      throw Exception('No token available');
    }
    final response = await http.get(
      Uri.parse('$baseUrl/users/id'),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': token,
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch user profile: ${response.body}');
    }
  }

  Future<http.Response> getLeaderboard(BuildContext context) async {
    await _checkTokenAndNavigate(context);
    final token = await getToken();
    if (token == null) {
      throw Exception('No token available');
    }
    final response = await http.get(
      Uri.parse('$baseUrl/leaderboard'),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': token,
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch leaderboard: ${response.body}');
    }
  }

  Future<http.Response> getFriends(BuildContext context,List<String> userIds) async {
    await _checkTokenAndNavigate(context);
    final token = await getToken();
    if (token == null) {
      throw Exception('No token available');
    }
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': token,
      },
      body: json.encode({'userIds': userIds}),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch followers: ${response.body}');
    }
  }

  Future<http.Response> getPosition(BuildContext context) async {
    await _checkTokenAndNavigate(context);
    final token = await getToken();
    if (token == null) {
      throw Exception('No token available');
    }
    final response = await http.get(
      Uri.parse('$baseUrl/leaderboard/position'),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': token,
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch user position: ${response.body}');
    }
  }

  Future<http.Response> updateUserProfile(BuildContext context,
      Map<String, dynamic> attributes) async {
        await _checkTokenAndNavigate(context);
    final token = await getToken();
    final response = await http.put(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': '$token',
      },
      body: jsonEncode(attributes),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update user profile: ${response.body}');
    }
  }

  Future<http.Response> updateStreak(BuildContext context) async {
    await _checkTokenAndNavigate(context);
    final token = await getToken();
    final response =
        await http.put(Uri.parse('$baseUrl/auth/streak'), headers: {
      'Content-Type': 'application/json',
      'x-auth-token': '$token',
    });
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update user streak: ${response.body}');
    }
  }

  Future<http.Response> updateOtherUser(BuildContext context, String id) async {
    await _checkTokenAndNavigate(context);
    final token = await getToken();
    final response = await http.put(Uri.parse('$baseUrl/users/id'),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': '$token',
        },
        body: jsonEncode({'_id': id}));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update other user: ${response.body}');
    }
  }

  Future<http.Response> getLeaderboardFriends(BuildContext context) async {
    await _checkTokenAndNavigate(context);
    final token = await getToken();
    if (token == null) {
      throw Exception('No token available');
    }
    final response = await http.get(
      Uri.parse('$baseUrl/leaderboard/friends'),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': token,
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch leaderboard: ${response.body}');
    }
  }

    Future<http.Response> getPositionFriends(BuildContext context) async {
      await _checkTokenAndNavigate(context);
    final token = await getToken();
    if (token == null) {
      throw Exception('No token available');
    }
    final response = await http.get(
      Uri.parse('$baseUrl/leaderboard/pfriends'),
      headers: {
        'Content-Type': 'application/json',
        'x-auth-token': token,
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch user position: ${response.body}');
    }
  }


  Future<http.Response> updateBadges(BuildContext context, badgeName) async {
    await _checkTokenAndNavigate(context);
    final token = await getToken();
    final response = await http.put(Uri.parse('$baseUrl/users/badge'),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': '$token',
        },
        body: jsonEncode({'badge': badgeName}));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update other user: ${response.body}');
    }
  }
  Future<void> forgotPassword(String email) async {
    email = email.toLowerCase();
    final response = await http.post(
      Uri.parse('$baseUrl/password/forgot-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to send verification code: ${response.body}');
    }
  }

  Future<void> verifyResetCode(String email, String code) async {
    email = email.toLowerCase();
    final response = await http.post(
      Uri.parse('$baseUrl/password/verify-reset-code'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'code': code}),
    );
    if (response.statusCode != 200) {
      throw Exception('Invalid verification code: ${response.body}');
    }
  }

  Future<void> resetPassword(String email, String code, String newPassword) async {
    email = email.toLowerCase();
    final response = await http.post(
      Uri.parse('$baseUrl/password/reset-password'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'code': code, 'newPassword': newPassword}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to reset password: ${response.body}');
    }
  }

  Future<bool> submitAnswers(BuildContext context, AnswerModel answers) async {
    final token = await getToken();

    if (token == null) {
      throw Exception('No token available');
    }

    try {
      final response = await http.put(
        Uri.parse('$baseUrl/users/questionnaire'),  // Using PUT instead of POST
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
        body: json.encode({"responses":answers.toJson()}),  // Send the answers as JSON
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to submit answers. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print("Error submitting answers: $e");
      return false;
    }
  }

}
