import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  final String apiKey = "AIzaSyD3OqeEP1mfsdPPMs9uIyg-C36fLx7NX98";
  final String baseUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash";

  // ✅ AI Text Response (Gemini API)
  Future<String> generateContent(String prompt) async {
    final url = Uri.parse("$baseUrl:generateContent?key=$apiKey");

    print("🔹 Sending Request to: $url");
    print("🔹 Request Body: $prompt");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {"parts": [{"text": prompt}]}
        ]
      }),
    );

    print("🔹 API Response Code: ${response.statusCode}");
    print("🔹 Raw Response: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String result = data["candidates"][0]["content"]["parts"][0]["text"] ?? "No response.";
      print("✅ AI Response: $result");
      return result;
    } else {
      print("❌ API Error: ${response.body}");
      return "❌ Error: ${response.statusCode}\n${response.body}";
    }
  }

 Future<String?> generateImage(String prompt) async {
  final url = Uri.parse("$baseUrl:generateContent?key=$apiKey");

  print("🔹 Sending Image Request to: $url");
  print("🔹 Request Prompt: $prompt");

  final response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "contents": [
        {"parts": [{"text": "Generate a high-quality image of: $prompt"}]}
      ]
    }),
  );

  print("🔹 API Response Code: ${response.statusCode}");
  print("🔹 Raw Response: ${response.body}");

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    // ✅ Ensure response contains an image, otherwise return error message
    if (data["candidates"] != null &&
        data["candidates"].isNotEmpty &&
        data["candidates"][0]["content"]["parts"] != null &&
        data["candidates"][0]["content"]["parts"].isNotEmpty &&
        data["candidates"][0]["content"]["parts"][0].containsKey("inline_data")) {
      
      String imageUrl = data["candidates"][0]["content"]["parts"][0]["inline_data"]["data"];
      print("✅ AI Image Generated Successfully!");
      return "data:image/png;base64,$imageUrl"; // Convert Base64 to displayable format
    } else {
      print("❌ API Error: Image not generated. Gemini API returned text.");
      return "❌ Error: API returned text instead of an image. Try a more detailed prompt.";
    }
  } else {
    print("❌ API Error: ${response.body}");
    return "❌ Error: ${response.statusCode}\n${response.body}";
  }
}

}
