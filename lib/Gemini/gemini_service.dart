import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  final String _apiUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent";
  final String _apiKey = "AIzaSyA5itHUM_7PW-JqUAWWJPGS0owR8w4NvBg";

  Future<String> sendMessageToGemini(String message) async {
    try {
      final response = await http.post(
        Uri.parse("$_apiUrl?key=$_apiKey"),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "contents": [
            {
              "parts": [
                {"text": message}
              ]
            }
          ]
        }),
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Adjusted the response parsing based on the structure
        if (data['candidates'] != null && data['candidates'].isNotEmpty) {
          final content = data['candidates'][0]['content'];
          if (content != null && content['parts'] != null && content['parts'].isNotEmpty) {
            return content['parts'][0]['text'];
          } else {
            throw Exception("Unexpected response format: 'parts' is null or empty");
          }
        } else {
          throw Exception("Unexpected response format: 'candidates' is null or empty");
        }
      } else {
        print('Error: ${response.statusCode}, Response: ${response.body}');
        throw Exception("Failed to connect to Gemini");
      }
    } catch (e) {
      print('Error: $e');
      throw Exception("Failed to connect to Gemini");
    }
  }
}
