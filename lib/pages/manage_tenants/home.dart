import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          "Dashboard ",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        // centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text(
              'Log out',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
