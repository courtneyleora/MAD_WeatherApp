import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  final TextEditingController _controller = TextEditingController();
  String cityName = '';
  int temperature = 0;
  String weatherCondition = '';

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  void fetchWeather() {
    setState(() {
      cityName = _controller.text;
      temperature = Random().nextInt(16) +
          15; // Generates a random temperature between 15 and 30
      weatherCondition = [
        'Sunny',
        'Cloudy',
        'Rainy'
      ][Random().nextInt(3)]; // Randomly selects a weather condition
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter city name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: fetchWeather,
                child: Text('Fetch Weather'),
              ),
              SizedBox(height: 16),
              Text('City: $cityName'),
              Text('Temperature: $temperature°C'),
              Text('Weather Condition: $weatherCondition'),
            ],
          ),
        ),
      ),
    );
  }
}
