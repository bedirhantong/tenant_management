import 'package:flutter/material.dart';

import '../../../model/service_model/tenant_models/tenant_model.dart';
import '../update_subscription.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key, required this.tenant});

  final TenantModel tenant;

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
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
      body: UpdateSubscription(
        tenant: _tenant,
      ),
    );
  }
}
