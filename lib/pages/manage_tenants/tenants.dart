import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class Tennants extends StatefulWidget {
  const Tennants({super.key});

  @override
  State<Tennants> createState() => _TennantsState();
}

class _TennantsState extends State<Tennants> {
  String searchText = "";

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0),
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
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: Text(
                            'Create'.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.refresh_outlined),
                          label: Text(
                            'Reload'.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            child: AnimSearchBar(
                              width: 400,
                              textController: textController,
                              rtl: true,
                              onSuffixTap: () {
                                setState(() {
                                  // textController.clear();
                                });
                              },
                              onSubmitted: (String) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
