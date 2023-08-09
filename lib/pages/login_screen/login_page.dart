import 'package:flutter/material.dart';

import 'login_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x2F685BFF).withOpacity(0.1),
      body: Stack(
        children: [
          const Image(
            image: NetworkImage('https://picsum.photos/200/300/?blur'),
            fit: BoxFit.cover, // Resmi Stack boyutuna göre ölçekle
            width: double.infinity, // Genişliği ekrana sığdır
            height: double.infinity, // Yüksekliği ekrana sığdır
          ),
          Center(
            child: Card(
              color: Colors.white60.withOpacity(0.4),
              child: Container(
                width: 400.0,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image:
                          AssetImage('assets/images/logo/mavi_arge_logo.png'),
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                    ),
                    Text(
                      'Enter your credentials to get started.',
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    ),
                    LoginForm(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
