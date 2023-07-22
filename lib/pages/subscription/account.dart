import 'package:flutter/material.dart';
import 'package:tenant_manager/pages/subscription/payment/payment_methods.dart';
import 'package:tenant_manager/pages/subscription/subscription_bill/subscription_bill.dart';

import '../../model/service_model/tenant_models/tenant_model.dart';

class Account extends StatefulWidget {
  const Account({super.key, required this.tenant});
  final TenantModel tenant;
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late Widget _currentAccountBodyContent;
  bool isSubButtonPressed = true;
  late TenantModel _tenant;

  @override
  void initState() {
    _tenant = widget.tenant;
    // Set the initial body content to Payment class content
    _currentAccountBodyContent = SubscriptionBill(tenant: _tenant);
    super.initState();
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
                          _currentAccountBodyContent =
                              SubscriptionBill(tenant: _tenant);
                          isSubButtonPressed = true;
                        },
                      );
                    },
                    child: const Text(
                      'Subscription',
                      style: TextStyle(
                        color: Color(0xFF685BFF),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      setState(() {
                        _currentAccountBodyContent =
                            SubscriptionBill(tenant: _tenant);
                        isSubButtonPressed = true;
                      });
                    },
                    child: const Text(
                      'Subscription',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
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
                        _currentAccountBodyContent = PaymentMethods(
                          tenant: _tenant,
                        );
                        isSubButtonPressed = false;
                      });
                    },
                    child: const Text(
                      'Payment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      setState(() {
                        // Update the body content to Subscription class content
                        _currentAccountBodyContent = PaymentMethods(
                          tenant: _tenant,
                        );
                        isSubButtonPressed = false;
                      });
                    },
                    child: const Text(
                      'Payment',
                      style: TextStyle(
                        color: Color(0xFF685BFF),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
