import 'package:flutter/material.dart';
import 'data_page.dart';

class Tennants extends StatefulWidget {
  const Tennants({Key? key}) : super(key: key);

  @override
  State<Tennants> createState() => _TennantsState();
}

class _TennantsState extends State<Tennants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tenants',
                      style: TextStyle(color: Colors.green, fontSize: 30.0),
                    ),
                    Text(
                      'Manage Tenants.',
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ],
                ),
                Container(
                  // padding: EdgeInsets.symmetric(horizontal: 30.0),
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
