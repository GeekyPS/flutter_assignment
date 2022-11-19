import 'package:flutter/material.dart';
import '../screens/people_list.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});
  static const routename = '/tabs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PeopleList(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: null,
        enableFeedback: true,
        currentIndex: 1,
        iconSize: 25,
        selectedItemColor: const Color.fromRGBO(112, 0, 255, 1),
        selectedLabelStyle:
            GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 14),
        unselectedLabelStyle:
            GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 14),
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home.svg'), label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/people.svg',
              ),
              label: 'People'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/create.svg'),
              label: 'Create'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/activities.svg'),
              label: 'Activities'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/profile.svg'),
              label: 'Profile'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.album_outlined), label: 'Create Groups'),
        ],
      ),
    );
  }
}
