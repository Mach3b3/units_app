import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class UnitsData with ChangeNotifier {
  // Private variables
  Map<String, dynamic> _units = {};
  bool _error = false;
  String _errorMessage = '';

  // Public variables
  bool filter = false;
  int selectedUnit = -1;

  // Getters
  Map<String, dynamic> get units => _units;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  // Select a unit and notify listeners
  void selectUnit({required int selectedUnit}) {
    filter = true;
    this.selectedUnit = selectedUnit - 1;
    notifyListeners();
  }

  // Fetch data from remote server
  Future<void> get fetchData async {
    final response = await get(
      Uri.parse(
          'https://dl.dropboxusercontent.com/s/bqop1r0plejx1ez/Units%201-3.json?dl=0'),
    );

    // Check if the response was successful
    if (response.statusCode == 200) {
      try {
        _units = jsonDecode(response.body);
        _error = false;
      } catch (error) {
        // Handle any errors that occur during decoding
        _error = true;
        _errorMessage = error.toString();
        _units = {};
      }
    } else {
      // Handle HTTP error response
      _error = true;
      _units = {};
      _errorMessage = 'Error: check internet connection';

      throw Exception('Failed to fetch data');
    }

    // Delay the notification until the next frame
    await Future.delayed(Duration.zero);
    notifyListeners();
  }

  // Reset the data and notify listeners
  void initialValues() {
    _units = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}
