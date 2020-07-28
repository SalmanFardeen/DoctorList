import 'package:flutter/material.dart';
import 'package:meals_app/category_functions/doctor_screen.dart';
import './widget/categories_screen.dart';

void main () => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor\'s appointment',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: CategoriesScreen(),
      routes: {
        DoctorScreen.routeName:(ctx) => DoctorScreen(),
      },
    );
  }
}


