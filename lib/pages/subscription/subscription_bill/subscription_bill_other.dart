import 'package:flutter/material.dart';

import '../../../model/service_model/tenant_models/tenant_model.dart';

class SubscriptionPlanBillOther extends StatefulWidget {
  const SubscriptionPlanBillOther({super.key, required this.tenant});
  final TenantModel tenant;
  @override
  State<SubscriptionPlanBillOther> createState() =>
      _SubscriptionPlanBillOtherState();
}

class _SubscriptionPlanBillOtherState extends State<SubscriptionPlanBillOther> {
  late TenantModel _tenant;

  @override
  void initState() {
    _tenant = widget.tenant;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E48),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildYourOwnPlan(context),
            const SizedBox(
              width: 10.0,
            ),
            buildFreeMembership(context),
          ],
        ),
      ),
    );
  }

  SizedBox buildYourOwnPlan(BuildContext context) {
    return SizedBox(
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
              'Create Your Own',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'customizable membership',
                style: TextStyle(fontSize: 10.0, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const ListTile(
              leading: Icon(
                Icons.check_circle_outline_outlined,
                color: Color(0xFF685BFF),
              ),
              title: Text(
                'Pick a due date and we will tell you how much you have to pay',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.check_circle_outline_outlined,
                color: Color(0xFF685BFF),
              ),
              title: Text(
                'Will estimate it with our special algorithm',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 100.0,
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
    );
  }

  SizedBox buildFreeMembership(BuildContext context) {
    return SizedBox(
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
              'Free Membership',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            const Text(
              '14-day free trial membership',
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
            const SizedBox(
              height: 130.0,
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
    );
  }
}
