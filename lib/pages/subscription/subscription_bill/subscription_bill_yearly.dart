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
              height: MediaQuery.of(context).size.height * 0.6,
              child: Card(
                color: const Color(0x737473FF).withOpacity(0.3),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Basic',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    const Text(
                      'Starter',
                      style: TextStyle(fontSize: 10.0, color: Colors.white),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'Standard Maintenance',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'Basic Financial Reporting',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'Email Support',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'Standard Lease',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    const Text(
                      r'$65/year',
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
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
              height: MediaQuery.of(context).size.height * 0.6,
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
                        'All Basic Membership Features',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'Smart Maintenance Tracking',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'Advanced Financial Reporting ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'Priority Email Support',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      r'$139/year',
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
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
              height: MediaQuery.of(context).size.height * 0.6,
              child: Card(
                color: const Color(0x737473FF).withOpacity(0.3),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Platinum',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    const Text(
                      'Go all in',
                      style: TextStyle(fontSize: 10.0, color: Colors.white),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'All Pro Membership Features',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        '24/7 Priority Phone Support',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'Real-Time Maintenance Tracking',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'Access to Beta Features and Exclusive Enhancements',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      r'$399/year',
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
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
