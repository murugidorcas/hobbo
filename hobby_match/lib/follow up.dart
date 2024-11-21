import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PreferencesForm(),
    );
  }
}

class PreferencesForm extends StatefulWidget {
  @override
  _PreferencesFormState createState() => _PreferencesFormState();
}

class _PreferencesFormState extends State<PreferencesForm> {
  String? _hobby = 'reading';
  String? _interest = 'technology';
  String? _musicGenre = 'Pop';

  final List<String> hobbies = ['reading', 'riding', 'swimming', 'drawing', 'singing'];
  final List<String> interests = ['technology', 'sports', 'photography', 'art', 'music'];
  final List<String> musicGenres = ['Pop', 'Rock', 'Jazz', 'Classical', 'Hip-hop'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
        backgroundColor: Color(0xFF4CAF50), // Green color for AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Your Hobbies, Interests, and Music Genre',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3A6F3B), // Green color
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildDropdown(
                    label: 'Hobby',
                    value: _hobby,
                    items: hobbies,
                    onChanged: (String? newValue) {
                      setState(() {
                        _hobby = newValue;
                      });
                    },
                  ),
                  _buildDropdown(
                    label: 'Interest',
                    value: _interest,
                    items: interests,
                    onChanged: (String? newValue) {
                      setState(() {
                        _interest = newValue;
                      });
                    },
                  ),
                  _buildDropdown(
                    label: 'Music Genre',
                    value: _musicGenre,
                    items: musicGenres,
                    onChanged: (String? newValue) {
                      setState(() {
                        _musicGenre = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle form submission
                      // You can add more logic here if needed.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Form Submitted')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF4CAF50), // Green button color
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3A6F3B), // Green label text
            ),
          ),
          SizedBox(height: 8),
          DropdownButton<String>(
            value: value,
            isExpanded: true,
            onChanged: onChanged,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            style: TextStyle(fontSize: 16),
            dropdownColor: Color(0xFFF9F9F9), // Light gray dropdown background
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xFF3A6F3B), width: 2),
            ),
          ),
        ],
      ),
    );
  }
}
