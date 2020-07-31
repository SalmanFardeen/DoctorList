import 'package:flutter/material.dart';
import './screens/doctor_screen.dart';
import './screens/categories_screen.dart';
import 'widgets/doctor_appointment.dart';
import 'radio.dart';
void main () => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor\'s appointment',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.tealAccent,
      ),
      home: RadioButton(title: 'radio',),

      routes: {
        DoctorScreen.routeName:(ctx) => DoctorScreen(),

      },
    );
  }
}


