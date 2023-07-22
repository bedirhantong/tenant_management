import 'package:flutter/material.dart';
import 'package:tenant_manager/pages/subscription/subscription_bill/subscription_bill_monthly.dart';
import 'package:tenant_manager/pages/subscription/subscription_bill/subscription_bill_other.dart';
import 'package:tenant_manager/pages/subscription/subscription_bill/subscription_bill_yearly.dart';

import '../../../model/service_model/tenant_models/tenant_model.dart';

class SubscriptionBill extends StatefulWidget {
  const SubscriptionBill({super.key, required this.tenant});
  final TenantModel tenant;
  @override
  State<SubscriptionBill> createState() => _SubscriptionBillState();
}

class _SubscriptionBillState extends State<SubscriptionBill> {
  late Widget _currentBodyContent;
  bool isMonthlyButtonPressed = true;
  bool isYearlyButtonPressed = false;
  bool isOtherButtonPressed = false;
  late TenantModel _tenant;
  @override
  void initState() {
    _tenant = widget.tenant;
    super.initState();
    // Set the initial body content to Payment class content
    _currentBodyContent = const SubscriptionPlanBillMonthly();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E2E48),
      appBar: AppBar(
        leading: const SizedBox(),
        forceMaterialTransparency: true,
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
            isMonthlyButtonPressed
                ? OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFF685BFF),
                        fixedSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0))),
                    onPressed: () {
                      setState(() {
                        _currentBodyContent =
                            const SubscriptionPlanBillMonthly();
                        isMonthlyButtonPressed = true;
                        isYearlyButtonPressed = false;
                        isOtherButtonPressed = false;
                      });
                    },
                    child: const Text(
                      'Bill monthly',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                : OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        // backgroundColor: const Color(0xFF685BFF),
                        fixedSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0))),
                    onPressed: () {
                      setState(() {
                        _currentBodyContent =
                            const SubscriptionPlanBillMonthly();
                        isMonthlyButtonPressed = true;
                        isYearlyButtonPressed = false;
                        isOtherButtonPressed = false;
                      });
                    },
                    child: const Text(
                      'Bill monthly',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
            const SizedBox(
              width: 10.0,
            ),
            isYearlyButtonPressed
                ? OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFF685BFF),
                        fixedSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0))),
                    onPressed: () {
                      setState(() {
                        _currentBodyContent =
                            const SubscriptionPlanBillYearly();
                        isYearlyButtonPressed = true;
                        isMonthlyButtonPressed = false;
                        isOtherButtonPressed = false;
                      });
                    },
                    child: const Text(
                      "Bill yearly",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                : OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        // backgroundColor: const Color(0xFF685BFF),
                        fixedSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0))),
                    onPressed: () {
                      setState(() {
                        _currentBodyContent =
                            const SubscriptionPlanBillYearly();
                        isYearlyButtonPressed = true;
                        isMonthlyButtonPressed = false;
                        isOtherButtonPressed = false;
                      });
                    },
                    child: const Text(
                      "Bill yearly",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
            const SizedBox(
              width: 10.0,
            ),
            isOtherButtonPressed
                ? OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFF685BFF),
                        fixedSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0))),
                    onPressed: () {
                      setState(() {
                        _currentBodyContent =
                            SubscriptionPlanBillOther(tenant: _tenant);
                        isYearlyButtonPressed = false;
                        isMonthlyButtonPressed = false;
                        isOtherButtonPressed = true;
                      });
                    },
                    child: const Text(
                      'Other',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                : OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        // backgroundColor: const Color(0xFF685BFF),
                        fixedSize: const Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0))),
                    onPressed: () {
                      setState(() {
                        _currentBodyContent =
                            SubscriptionPlanBillOther(tenant: _tenant);
                        isYearlyButtonPressed = false;
                        isMonthlyButtonPressed = false;
                        isOtherButtonPressed = true;
                      });
                    },
                    child: const Text(
                      'Other',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
          ],
        ),
      ),
      body: _currentBodyContent,
    );
  }
}
