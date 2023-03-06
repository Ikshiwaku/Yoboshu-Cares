import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoboshu_cares/provider/timer_provider.dart';

import 'screens/meal_timer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => TimerProvider(),
      child: const MaterialApp(home: MealTimerScreen()),
    );
  }
}

