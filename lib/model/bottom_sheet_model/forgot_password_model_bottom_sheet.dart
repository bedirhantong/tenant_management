import 'package:flutter/material.dart';

import '../../pages/forgot_password/forgot_password_email/forget_password_email.dart';
import '../../pages/forgot_password/forgot_password_options/forgot_password_btn_widget.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Make Selection',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "Select one of the options given below to reset your password.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: "E-mail",
              subtitle: "Reset via E-mail verification.",
              onTap: () {
                Navigator.pop(context); //bottom sheetten öncekine döneriz
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordMailScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: "Phone",
              subtitle: "Reset via Phone verification.",
              onTap: () {
                // Navigator.pop(context); //bottom sheetten öncekine döneriz
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ForgotPasswordPhoneScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
