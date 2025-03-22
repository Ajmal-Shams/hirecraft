import 'package:flutter/material.dart';
import '../../../services/gemini_service.dart';
import '../../../widgets/navbar/bottom_nav_bar.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  _AIChatScreenState createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final GeminiService _geminiService = GeminiService();
  final TextEditingController _controller = TextEditingController();
  String _response = "";
  String _imageUrl = "";
  String _selectedMode = "Text"; // Default mode



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI Chat"), automaticallyImplyLeading: false),
      body: Column(
        children: [
          // Dropdown to select Text or Image mode
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: _selectedMode,
              items: ["Text", "Image"].map((String mode) {
                return DropdownMenuItem<String>(
                  value: mode,
                  child: Text(mode),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMode = newValue!;
                  _response = "";
                  _imageUrl = "";
                });
              },
            ),
          ),
          
          // Display AI Response or Image
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: _imageUrl.isNotEmpty
                    ? Image.network(_imageUrl, errorBuilder: (context, error, stackTrace) {
                        return const Text("Failed to load image");
                      }) // Display AI-generated image
                    : Text(
                        _response,
                        style: const TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ),

          // Input Field & Send Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Ask AI something...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed:() {
                    
                  },
               
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
    );
  }
}
