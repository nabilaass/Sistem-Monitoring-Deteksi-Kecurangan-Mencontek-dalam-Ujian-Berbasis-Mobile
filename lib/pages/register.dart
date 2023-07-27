import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:projek/pages/login_page.dart';
import 'package:projek/pages/token.dart';

class register extends StatefulWidget {
  const register({Key? key});

  @override
  State<register> createState() => _registerState();
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

class _registerState extends State<register> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  Future<void> _register() async {
    final String nama = _namaController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String repassword = _repasswordController.text;

    final _registerState = GlobalKey<FormState>();

    final response = await https.post(
      Uri.parse('http://172.20.10.4:5000/register'),
      body: jsonEncode({
        'nama': nama,
        'email': email,
        'password': password,
        'confirm_password': repassword,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      //final Map<String, dynamic> responseData = json.decode(response.body);
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mytoken()),
      );
      // TODO: Handle successful login and navigate to another page
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['message'];
      // TODO: Display login error message
    }
  }

  bool passVisible = false;
  @override
  void initState() {
    super.initState();
    passVisible = true;
  }

  Widget buildTextField(
      TextEditingController controller, String labelText, bool obscureText) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
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
            buildTextField(_namaController, 'Name', false),
            SizedBox(height: 16.0),
            buildTextField(_emailController, 'Email', false),
            SizedBox(height: 16.0),
            buildTextField(_passwordController, 'Password', true),
            SizedBox(height: 16.0),
            buildTextField(_repasswordController, 'Re-Password', true),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _register,
              child: const Text('Register'),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff5C6BC0), // Warna latar belakang button
                onPrimary: Colors.white, // Warna teks pada button
                padding:
                    const EdgeInsets.symmetric(vertical: 10), // Padding button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(
                      8.0)), // Membuat sudut button menjadi melengkung
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You have an account? ",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff999a9e),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign In ",
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xff999a9e),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
