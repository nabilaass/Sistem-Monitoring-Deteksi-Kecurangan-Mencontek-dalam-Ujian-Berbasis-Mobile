import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:projek/pages/login_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key});

  void editProfile(BuildContext context) {
    // TODO: Implement edit profile functionality
    // Contoh aksi yang dijalankan ketika tombol Edit Profile ditekan
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: const Text('Proses edit profile...'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff5C6BC0),
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nabila',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'nabilaasshafap@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
          ),
          SizedBox(height: 16),
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.user_circle,
              size: 30,
              color: Colors.grey[600],
            ),
            title: Text('Edit Profile'),
            onTap: () {
              editProfile(context);
            },
          ),
          ListTile(
            leading: Icon(
              LineAwesomeIcons.lock,
              size: 30,
              color: Colors.grey[600],
            ),
            title: Text('Change Password'),
            onTap: () {
              // TODO: Implement change password functionality
            },
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
            child: Text('Logout'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(150, 50),
              primary: Color(0xff5C6BC0),
            ),
          ),
        ],
      ),
    );
  }
}
