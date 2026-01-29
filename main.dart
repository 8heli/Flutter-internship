import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() { //Entry point
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { //Main widget
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day 11 - Local Storage', //App title
      home: HomeScreen(), //First screen of app
    );
  }
}

/// Service to handle SharedPreferences
class LocalStorageService {
  static const String _key = 'user_data';

  static Future<void> save(String value) async {
    final prefs = await SharedPreferences.getInstance(); //Get instance
    await prefs.setString(_key, value); // Save value
  }

  static Future<String?> load() async {
    final prefs = await SharedPreferences.getInstance();//Get instance
    return prefs.getString(_key);// Return value or null
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();//Get instance
    await prefs.remove(_key);//Remove value
  }
}

class HomeScreen extends StatefulWidget { //Main screen widget
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String savedValue = "";

  @override
  void initState() {
    super.initState();
    _loadData();
  }
  /// Load saved data from SharedPreference
  Future<void> _loadData() async {
    final value = await LocalStorageService.load();
    setState(() {
      savedValue = value ?? "";
    });
  }
  /// Save the text entered in TextField to SharedPreferences
  Future<void> _saveData() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    await LocalStorageService.save(text);
    setState(() {
      savedValue = text;
    });
    _controller.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data saved successfully!')),
    );
  }
  /// Clear the saved data
  Future<void> _clearData() async {
    await LocalStorageService.clear();
    setState(() => savedValue = ""); //Clears display

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Data cleared!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        title: const Text("Day 11 - Local Storage"),
        backgroundColor: Colors.lightBlue.shade400,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Enter name or email",
                labelStyle: const TextStyle(color: Colors.white70),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue.shade400),
                ),
              ),
              cursorColor: Colors.lightBlue.shade200,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _saveData,
              icon: const Icon(Icons.save),
              label: const Text("Save Data"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue.shade400,
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              savedValue.isEmpty
                  ? "No data saved"
                  : "Saved Value: $savedValue",
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _clearData,
              icon: const Icon(Icons.delete),
              label: const Text("Clear Saved Data"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue.shade400,
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
