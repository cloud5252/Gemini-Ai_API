import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// void main() {
//   runApp(MaterialApp(home: GeminiChatScreen()));
// }

class GeminiService {
  final String _apiKey =
      "api_key"; // Replace with your actual API key
  final String _baseUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent";

  Future<String> generateText(String prompt) async {
    final response = await http.post(
      Uri.parse('$_baseUrl?key=$_apiKey'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt},
            ],
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Extract the generated text. The exact path might vary slightly depending on the Gemini API response structure.
      // You'll need to inspect the API response to get the correct path.
      return data['candidates'][0]['content']['parts'][0]['text'];
    } else {
      throw Exception(
        'Failed to load response: ${response.statusCode} ${response.body}',
      );
    }
  }
}

class GeminiChatScreen extends StatefulWidget {
  @override
  _GeminiChatScreenState createState() => _GeminiChatScreenState();
}

class _GeminiChatScreenState extends State<GeminiChatScreen> {
  final TextEditingController _controller = TextEditingController();
  String _responseText = "Enter a prompt and hit 'Generate'";
  final GeminiService _geminiService = GeminiService();

  void _generateResponse() async {
    setState(() {
      _responseText = "Generating...";
    });
    try {
      final response = await _geminiService.generateText(_controller.text);
      setState(() {
        _responseText = response;
      });
    } catch (e) {
      setState(() {
        _responseText = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gemini AI Chat")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: Text(_responseText))),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter your prompt here",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _generateResponse,
              child: Text("Generate"),
            ),
          ],
        ),
      ),
    );
  }
}

class mynewapp extends StatelessWidget {
  const mynewapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GeminiChatScreen(),
    );
  }
}
