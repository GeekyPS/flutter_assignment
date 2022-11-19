import 'package:flutter/material.dart';
import './screens/tabs.dart';
import './screens/people_profile.dart';
import './screens/people_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOGO',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(112, 0, 255, 1),
        
      ),
      routes: {
        PeopleList.rountename: (context) => PeopleList(),
        Peopleprofile.rountename: (context) => const Peopleprofile(),
        TabsScreen.routename: (context) => const TabsScreen(),
      },
      home: const TabsScreen(),
    );
  }
}
