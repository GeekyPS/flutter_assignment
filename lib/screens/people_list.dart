import 'dart:convert';

import 'package:flutter/material.dart';
import '../screens/people_profile.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class PeopleList extends StatelessWidget {
  PeopleList({super.key});
  static const rountename = '/peopleList';

  var _postsJson = [];

  Future<void> fetchPosts(context) async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      final jsonData = jsonDecode(response.body) as List;

      _postsJson = jsonData;
    } catch (err) {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: AlertDialog(
                title: Text(err.toString()),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Dismiss',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: const Color.fromRGBO(112, 0, 255, 1)),
                    ),
                  ),
                ],
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(color: Color.fromRGBO(238, 238, 238, 1), width: 1),
        ),
        title: Image.asset(
          'assets/images/Logo.jpg',
          width: 58,
          height: 16,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/notification.svg'),
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/search.svg')),
        ],
        centerTitle: false,
      ),
      body: FutureBuilder(
          future: fetchPosts(context),
          builder: (context, future) {
            return future.connectionState == ConnectionState.waiting
                ? const Center(
                    child: SizedBox(
                      width: 100,
                      child: LinearProgressIndicator(
                        color: Color.fromRGBO(112, 0, 255, 1),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 14),
                          child: ListTile(
                              tileColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color.fromRGBO(238, 238, 238, 1),
                                    width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              leading: Image.asset(
                                  'assets/images/dp${((index) % 5) + 1}.jpg'),
                              title: Text(
                                _postsJson[index]['name'],
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color.fromRGBO(20, 20, 20, 1)),
                              ),
                              subtitle: Text(
                                '@${_postsJson[index]['username']}',
                                style: GoogleFonts.roboto(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      Peopleprofile.rountename,
                                      arguments: _postsJson[index]);
                                },
                                child: Container(
                                  height: 30,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            238, 238, 238, 1),
                                        width: 1),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'View',
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: const Color.fromRGBO(
                                              112, 0, 255, 1)),
                                    ),
                                  ),
                                ),
                              )),
                        );
                      },
                      itemCount: _postsJson.length,
                    ),
                  );
          }),
    );
  }
}
