import 'package:flutter/material.dart';
import 'theme_con/theme.dart';
var theme;

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:SingleChildScrollView(
          child: Column(
            children: [
              Text("Heading",style: theme.text14blue),
            ],
          ),
        )
      ),
    );
  }
}