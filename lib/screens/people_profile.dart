import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class Peopleprofile extends StatelessWidget {
  const Peopleprofile({super.key});
  static const rountename = '/peopleProfile';

  @override
  Widget build(BuildContext context) {
    final currentProfile = ModalRoute.of(context)!.settings.arguments as Map;
    String phone = currentProfile['phone'];

    if (phone.contains('x')) {
      final indexX = phone.indexOf('x');
      phone = phone.substring(
        0,indexX
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: const Border(
          bottom: BorderSide(color: Color.fromRGBO(238, 238, 238, 1), width: 1),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          currentProfile['name'],
          style: GoogleFonts.roboto(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
        ),
        centerTitle: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset(
                      'assets/images/dp${(((currentProfile['id'] - 1) % 5) + 1)}.jpg'),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      currentProfile['name'],
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: const Color.fromRGBO(20, 20, 20, 1)),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      '@${currentProfile['username']}',
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(140, 140, 140, 1)),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Email: ',
                    style: GoogleFonts.roboto(
                      color: const Color.fromRGBO(140, 140, 140, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: currentProfile['email'],
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Address: ',
                    style: GoogleFonts.roboto(
                      color: const Color.fromRGBO(140, 140, 140, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text:
                        '${currentProfile['address']['street']}, ${currentProfile['address']['suite']}, ${currentProfile['address']['city']}, ${currentProfile['address']['zipcode']}  ',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Phone: ',
                    style: GoogleFonts.roboto(
                      color: const Color.fromRGBO(140, 140, 140, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: phone,
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Website: ',
                    style: GoogleFonts.roboto(
                      color: const Color.fromRGBO(140, 140, 140, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: currentProfile['website'].trim(),
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
