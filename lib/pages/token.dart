import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:projek/pages/home_page.dart';

class Mytoken extends StatefulWidget {
  const Mytoken({Key? key});

  @override
  State<Mytoken> createState() => _MytokenState();
}

class HeadClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _MytokenState extends State<Mytoken> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _otp() async {
    if (_formKey.currentState!.validate()) {
      final String otp = _emailController.text;

      final response = await https.post(
        Uri.parse('http://172.20.10.4:5000/verify'),
        body: jsonEncode({'otp': otp}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        // TODO: Handle successful login and navigate to another page
      } else {
        final Map<String, dynamic> errorData = json.decode(response.body);
        final String errorMessage = errorData['message'];
        // TODO: Display login error message
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipPath(
              clipper: HeadClipper(),
              child: Container(
                margin: const EdgeInsets.all(0),
                width: double.infinity,
                height: 230,
                decoration: const BoxDecoration(
                  color: Color(0xff5C6BC0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/exam.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text(
                "Verify your account",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20.10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'OTP',
                      labelStyle:
                          TextStyle(color: Colors.black), // Warna teks label
                      border: OutlineInputBorder(
                        // Menggunakan outline border
                        borderRadius: BorderRadius.circular(
                            10.0), // Melengkungkan sudut border
                      ),
                      focusedBorder: OutlineInputBorder(
                        // Tampilan border saat dalam keadaan focus
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            color: Color(
                                0xff5C6BC0)), // Warna border saat dalam keadaan focus
                      ),
                      filled: true, // Mengaktifkan latar belakang terisi
                      fillColor: Colors.white, // Warna latar belakang terisi
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the OTP';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.20),
                  ElevatedButton(
                    onPressed: _otp,
                    child: const Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff5C6BC0), // Warna latar belakang button
                      onPrimary: Colors.white, // Warna teks pada button
                      padding:
                          EdgeInsets.symmetric(vertical: 10), // Padding button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            8.0)), // Membuat sudut button menjadi melengkung
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
