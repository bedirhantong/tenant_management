import 'package:flutter/material.dart';
import 'package:tenant_manager/pages/subscription/payment/payment_methods.dart';
import 'package:tenant_manager/pages/subscription/subscription_bill/subscription_bill.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late Widget _currentAccountBodyContent;
  bool isSubButtonPressed = true;

  @override
  void initState() {
    super.initState();
    // Set the initial body content to Payment class content
    _currentAccountBodyContent = const SubscriptionBill();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E48),
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Builder(
          builder: (BuildContext context) {
            return const Image(
                image: AssetImage('assets/images/logo/mavi_arge_logo.png'));
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
            top: Radius.circular(
                30), // Dilediğiniz yuvarlaklık oranını belirleyebilirsiniz
          ),
        ),
        elevation: 50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSubButtonPressed
                ? TextButton(
                    onPressed: () {
                      setState(
                        () {
                          _currentAccountBodyContent = const SubscriptionBill();
                          isSubButtonPressed = true;
                        },
                      );
                    },
                    child: const Text(
                      'Subscription',
                      style: TextStyle(color: Color(0xFF685BFF), fontSize: 16),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      setState(() {
                        _currentAccountBodyContent = const SubscriptionBill();
                        isSubButtonPressed = true;
                      });
                    },
                    child: const Text(
                      'Subscription',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
            const SizedBox(
              width: 10.0,
            ),
            isSubButtonPressed
                ? TextButton(
                    onPressed: () {
                      setState(() {
                        // Update the body content to Payment class content
                        _currentAccountBodyContent = const PaymentMethods();
                        isSubButtonPressed = false;
                      });
                    },
                    child: const Text(
                      'Payment',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      setState(() {
                        // Update the body content to Subscription class content
                        _currentAccountBodyContent = const PaymentMethods();
                        isSubButtonPressed = false;
                      });
                    },
                    child: const Text(
                      'Payment',
                      style: TextStyle(color: Color(0xFF685BFF), fontSize: 16),
                    ),
                  ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: _currentAccountBodyContent,
      ),
    );
  }
}
