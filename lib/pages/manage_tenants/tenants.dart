import 'package:flutter/material.dart';
import 'data_page.dart';

class Tenants extends StatefulWidget {
  const Tenants({Key? key}) : super(key: key);

  @override
  State<Tenants> createState() => _TenantsState();
}

class _TenantsState extends State<Tenants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Tenants',
                      style: TextStyle(color: Colors.green, fontSize: 30.0),
                    ),
                    Text(
                      'Manage Tenants',
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DataPage(),
                    ],
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
