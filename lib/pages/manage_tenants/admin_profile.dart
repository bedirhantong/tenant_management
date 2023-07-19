import 'package:flutter/material.dart';

class AdminProfile extends StatefulWidget {
  const AdminProfile({super.key});

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF464667),
      appBar: AppBar(
        forceMaterialTransparency: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
            top: Radius.circular(
                30), // Dilediğiniz yuvarlaklık oranını belirleyebilirsiniz
          ),
        ),
        // elevation: 50,
        title: const Text(
          "Admin Profile",
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        centerTitle: true,
        actions: [
          // ElevatedButton(
          //   onPressed: () {
          //     setState(() {});
          //   },
          //   child: const Text(
          //     'Log out',
          //     style: TextStyle(color: Colors.black),
          //   ),
          // ),
          // const SizedBox(
          //   width: 20.0,
          // ),
        ],
      ),
    );
  }
}
