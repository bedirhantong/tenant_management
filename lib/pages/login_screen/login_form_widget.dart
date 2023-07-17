import 'package:flutter/material.dart';
import 'package:tenant_manager/consts/token_class.dart';

import '../../model/service_model/base_model.dart';
import '../../model/service_model/token_models/authenticate_model.dart';
import '../../service/tokens_service.dart';
import '../manage_tenants/tenants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;
  String email = "admin@root.com";
  String password = r"123Pa$$word!";
  //Başına r harfi koymamın nedeni $ işaretini kullanabilmek için.

  Widget _buildSuffixIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
      icon: _isPasswordVisible
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // email
            TextFormField(
              initialValue: email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "E-mail",
                hintText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // password
            TextFormField(
              initialValue: password,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: "Password",
                hintText: "Password",
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                suffixIcon: _buildSuffixIcon(),
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // Tenant
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.apartment_outlined),
                labelText: "Tenant",
                hintText: "Tenant",
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                  fontStyle: FontStyle.italic,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // register forgot password kısmı
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Register?
                TextButton.icon(
                  onPressed: () {
                    // Implement register functionality
                  },
                  icon: const Icon(Icons.app_registration_rounded),
                  label: Text(
                    'Register?'.toUpperCase(),
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                ),
                // Forgot Password
                TextButton.icon(
                  onPressed: () {
                    // Implement forgot password functionality
                  },
                  icon: const Icon(Icons.lock_reset_outlined),
                  label: Text(
                    'Forgot Password?'.toUpperCase(),
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // Sign in Butonu
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    showLogIn(TokensService.getToken(email, password));
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )), // Sign in
            ),
            const SizedBox(
              height: 10,
            ),
            // Fill administrator credentials
            TextButton.icon(
              onPressed: () {
                // Implement register functionality
              },
              icon: const Icon(Icons.crop_free),
              label: Text(
                'Fill administrator credentials?'.toUpperCase(),
                style: const TextStyle(color: Colors.black, fontSize: 12),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLogIn(Future<BaseModel<AuthenticateModel>> logInFuture) async {
    showDialog(
      context: context,
      builder: (context) => FutureBuilder<BaseModel<AuthenticateModel>>(
          future: logInFuture,
          builder:
              ((context, AsyncSnapshot<BaseModel<AuthenticateModel>> snapshot) {
            if (snapshot.hasData && snapshot.data!.suc) {
              ///Sunucuya 200 ile başarılı istek atıldı
              return SimpleDialog(
                title: const Text("Oturum açma başarılı"),
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        TokenClass.me = snapshot.data!.data!;
                      });
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Tenants()),
                        (route) => false,
                      );
                    },
                    child: const Text("Tamam"),
                  ),
                ],
              );
            } else if (snapshot.hasData && !snapshot.data!.suc) {
              ///Sunucuya 400 veya başka kod ile ile başarısız istek atıldı
              return SimpleDialog(
                title: const Text("Error"),
                children: [
                  Text(snapshot.data!.exception.toString()),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Tamam"),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return SimpleDialog(
                title: const Text("Error"),
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Tamam"),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          })),
    );
  }
}
