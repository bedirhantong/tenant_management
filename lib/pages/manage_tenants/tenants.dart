import 'package:flutter/material.dart';

class Tennants extends StatelessWidget {
  const Tennants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50.0),
                const Column(
                  children: [
                    Text(
                      'Tenants',
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      'Manage Tenants.',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Container(
                  width: 400.0,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            label: Text(
                              'Create'.toUpperCase(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            label: Text(
                              'Reload'.toUpperCase(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
