import 'package:flutter/material.dart';
import 'package:flutter_form_guiphanhoi/feedback_form.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeedbackScreen(),
      
    );
  }
}