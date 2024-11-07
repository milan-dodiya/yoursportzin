import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentQuestionIndex = 0;
  int? _selectedOptionIndex;

  final List<String> _questions = [
    'Choose your Gender',
    'How many workouts do you do per week?',
    'Have You tried other calorie tracking apps ',
  ];

  final List<List<Map<String, String>>> _options = [
    [
      {'title': 'Male', 'description': ''},
      {'title': 'Female', 'description': ''},
      {'title': 'Other', 'description': ''},
    ],
    [
      {'title': '0 - 2', 'description': 'Workouts now and then'},
      {'title': '3 - 5', 'description': 'A few workouts per week'},
      {'title': '6+', 'description': 'Dedicated athlete'},
    ],
    [
      {'title': 'Yes', 'description': ''},
      {'title': 'No', 'description': ''},
    ],
  ];

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = null; // Reset selection for the new question
      });
    }
  }

  double _progressValue() {
    return (_currentQuestionIndex + 1) / _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Questionnaire"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (_currentQuestionIndex > 0) {
              setState(() {
                _currentQuestionIndex--;
                _selectedOptionIndex =
                    null; // Reset selection for the previous question
              });
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: _progressValue(),
              backgroundColor: Colors.grey[300],
              color: Colors.black,
              minHeight: 8.0,
            ),
            SizedBox(height: 20),
            Text(
              _questions[_currentQuestionIndex],
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
              if(_currentQuestionIndex==0 || _currentQuestionIndex==1)
              Text(
                "This will be used to calibrate your custom plan.",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),

            SizedBox(height: 30),
            // Display options as selectable cards with icons and descriptions
            ..._options[_currentQuestionIndex].asMap().entries.map((entry) {
              int idx = entry.key;
              Map<String, String> option = entry.value;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedOptionIndex = idx;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: _selectedOptionIndex == idx
                        ? Colors.black
                        : Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _selectedOptionIndex == idx
                          ? Colors.blue
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        option['title']!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _selectedOptionIndex == idx
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      if (option['description']!.isNotEmpty)
                        Text(
                          option['description']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: _selectedOptionIndex == idx
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
            Spacer(),
            // Next button
            ElevatedButton(
              onPressed: _selectedOptionIndex != null
                  ? () {
                      _nextQuestion();
                    }
                  : null, // Disable button if no option is selected
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text("Next",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
