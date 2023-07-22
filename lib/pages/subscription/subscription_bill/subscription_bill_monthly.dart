import 'package:flutter/material.dart';

class SubscriptionPlanBillMonthly extends StatelessWidget {
  const SubscriptionPlanBillMonthly({Key? key}) : super(key: key);

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
                        'Limited Number of Properties',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'Standard Lease Management',
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
                    const SizedBox(
                      height: 40.0,
                    ),
                    const Text(
                      r'$65/month',
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
                        'Customizable Lease Templates',
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
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'Advanced Financial Reporting',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      r'$139/month',
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
                        'Portfolio-level Reporting and Analysis',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                        color: Color(0xFF685BFF),
                      ),
                      title: Text(
                        'Dedicated Account Manager',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 42.0,
                    ),
                    const Text(
                      r'$399/month',
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
