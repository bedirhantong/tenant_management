import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../consts/text_strings.dart';

class OTPScreenPayment extends StatelessWidget {
  const OTPScreenPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F5FA7).withOpacity(0.48),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  otpTitle,
                  style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  otpSubTitle.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(
                  height: 60.0,
                ),
                Text(otpMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(
                  height: 60.0,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  keyboardType: TextInputType.number,
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  onSubmit: (code) {
                    if (kDebugMode) {
                      print("OTP is => $code");
                    }
                  },
                ),
                const SizedBox(
                  height: 60.0,
                ),
                SizedBox(
                  width: 400.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Accept".toUpperCase()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
