import 'package:flutter/material.dart';

import 'login_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x2F685BFF).withOpacity(0.1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),
                Card(
                  color: Colors.white60,
                  child: Container(
                    width: 400.0,
                    padding: const EdgeInsets.all(20.0),
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black12),
                    // ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/images/logo/mavi_arge_logo.png'),
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
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
