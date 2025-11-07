// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Gemini AI Chat',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: GeminiChatScreen(),
//     );
//   }
// }

// class GeminiChatScreen extends StatefulWidget {
//   @override
//   _GeminiChatScreenState createState() => _GeminiChatScreenState();
// }

// class _GeminiChatScreenState extends State<GeminiChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   String _responseText = "Response will appear here.";
//   bool _isLoading = false;

//   // Replace with your Gemini API key
//   static const String apiKey = "AIzaSyAbVh3ikKJBvNw245aErvFtUChhx4_Mu0c";
//   // static const String apiUrl = "https://generativelanguage.googleapis.com/v1/models/gemini-pro:generateContent?key=$apiKey";
//   static const String apiUrl =
//       "https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent?key=$apiKey";

//   Future<void> generateText(String prompt) async {
//     setState(() {
//       _isLoading = true;
//       _responseText = "Generating response...";
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode({
//           "contents": [
//             {
//               "parts": [
//                 {"text": prompt}
//               ]
//             }
//           ]
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         String generatedText =
//             data["candidates"][0]["content"]["parts"][0]["text"];

//         setState(() {
//           _responseText = generatedText;
//         });
//       } else {
//         setState(() {
//           _responseText = "Error: ${response.statusCode}";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _responseText = "Failed to generate response.";
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Gemini AI Chat")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 labelText: "Enter your prompt",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _isLoading
//                   ? null
//                   : () {
//                       String inputText = _controller.text.trim();
//                       if (inputText.isNotEmpty) {
//                         generateText(inputText);
//                       }
//                     },
//               child: _isLoading
//                   ? CircularProgressIndicator()
//                   : Text("Generate Response"),
//             ),
//             SizedBox(height: 16),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Text(
//                   _responseText,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
