import 'package:demo_application/Quiz_Screen/QuizPage.dart';
import 'package:flutter/material.dart';

class HealthProfileScreen1 extends StatefulWidget {
  final String goal; // Receive the goal parameter

  const HealthProfileScreen1({Key? key, required this.goal}) : super(key: key);

  @override
  _HealthProfileScreenState createState() => _HealthProfileScreenState();
}

class _HealthProfileScreenState extends State<HealthProfileScreen1> {
  bool dietPreferenceYes = false;
  bool dietPreferenceNo = false;
  bool allergiesYes = false;
  bool allergiesNo = false;
  bool alcoholYes = false;
  bool alcoholNo = false;
  String? exerciseFrequency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Image.asset('assets/logo.png', height: 50),
                    SizedBox(height: 20),
                    Text(
                      'Health Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(thickness: 1),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // ✅ Display the selected goal
              Text(
                'Selected Goal: ${widget.goal}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              _buildNumberInputField('Your Weight', 'Weight (in kg)'),
              _buildNumberInputField('Your Height', 'Height (in cm)'),
              _buildNumberInputField('Your Goal Weight', 'Weight (in kg)'),
              _buildToggleButtons('Diet Preference', (value) {
                setState(() {
                  dietPreferenceYes = value == 'Yes';
                  dietPreferenceNo = value == 'No';
                });
              }),
              _buildDropdown('Exercise Frequency (Per Week)', (String? value) {
                setState(() {
                  exerciseFrequency = value;
                });
              }),
              _buildCheckboxGroup('Medical Conditions', [
                'Diabetes',
                'Thyroid',
                'Hypertension',
                'None',
              ]),
              _buildToggleButtons('Allergies', (value) {
                setState(() {
                  allergiesYes = value == 'Yes';
                  allergiesNo = value == 'No';
                });
              }),
              _buildDropdown('Current Supplements', (String? value) {}),
              _buildToggleButtons('Alcohol Consumption', (value) {
                setState(() {
                  alcoholYes = value == 'Yes';
                  alcoholNo = value == 'No';
                });
              }),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizPage()),
                    );
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberInputField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget _buildToggleButtons(String label, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Row(
          children:
              ['Yes', 'No'].map((option) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            (option == 'Yes' && dietPreferenceYes) ||
                                    (option == 'No' && dietPreferenceNo)
                                ? Colors.green
                                : Colors.grey[300],
                      ),
                      onPressed: () => onChanged(option),
                      child: Text(option),
                    ),
                  ),
                );
              }).toList(),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget _buildDropdown(String label, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          items:
              [
                'Daily',
                'Weekly',
                'Monthly',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: onChanged,
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget _buildCheckboxGroup(String label, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Column(
          children:
              options.map((option) {
                return CheckboxListTile(
                  title: Text(option),
                  value: false,
                  onChanged: (bool? value) {},
                );
              }).toList(),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
