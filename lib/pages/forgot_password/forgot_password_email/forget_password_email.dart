import 'package:flutter/material.dart';

import '../../../common_widgets/form/form_header_widget.dart';
import '../../../consts/image_strings.dart';
import '../../../consts/sizes.dart';
import '../../../consts/text_strings.dart';
import '../forgot_password_otp/otp_screen.dart';

class ForgotPasswordMailScreen extends StatelessWidget {
  const ForgotPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF5F5FA7).withOpacity(0.48),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              children: [
                const FormHeaderWidget(
                  image: otpEmailPng,
                  subtitle: forgotMailSubTitle,
                  imageHeight: 0.5,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Form(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 400.0,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Email"),
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        SizedBox(
                          width: 400.0,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.pop(context);
                              // Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const OTPScreen()));
                            },
                            child: const Text('Next'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
