import 'package:flutter/material.dart';

class SubscriptionPlanBillYearly extends StatefulWidget {
  const SubscriptionPlanBillYearly({super.key});

  @override
  State<SubscriptionPlanBillYearly> createState() =>
      _SubscriptionPlanBillYearlyState();
}

class _SubscriptionPlanBillYearlyState
    extends State<SubscriptionPlanBillYearly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E48),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Card(
                color: const Color(0x737473FF).withOpacity(0.3),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Pro Business',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    const Text(
                      'Better Results',
                      style: TextStyle(fontSize: 10.0, color: Colors.white),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      r'$250/year',
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFF685BFF),
                        fixedSize: const Size(150, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Choose',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Card(
                color: const Color(0x737473FF).withOpacity(0.3),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Pro Business',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    const Text(
                      'Better Results',
                      style: TextStyle(fontSize: 10.0, color: Colors.white),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      r'$250/year',
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFF685BFF),
                        fixedSize: const Size(150, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Choose',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Card(
                color: const Color(0x737473FF).withOpacity(0.3),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Pro Business',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    const Text(
                      'Better Results',
                      style: TextStyle(fontSize: 10.0, color: Colors.white),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      r'$250/year',
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFF685BFF),
                        fixedSize: const Size(150, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Choose',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Card(
                color: const Color(0x737473FF).withOpacity(0.3),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Create your own plan ',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    const Text(
                      'In addition to the date you have chosen ',
                      style: TextStyle(fontSize: 10.0, color: Colors.white),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months free',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '2 Months',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      r'$250/year',
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFF685BFF),
                        fixedSize: const Size(150, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Choose',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
