import 'package:flutter/material.dart';
import 'package:tenant_manager/pages/manage_tenants/tenants.dart';

import '../../consts/token_class.dart';
import '../../model/service_model/base_model.dart';
import '../../model/service_model/tenant_models/tenant_model.dart';
import '../../service/tenant_service.dart';

class ResponsiveTenantsPage extends StatefulWidget {
  const ResponsiveTenantsPage({super.key});

  @override
  State<ResponsiveTenantsPage> createState() => _ResponsiveTenantsPageState();
}

class _ResponsiveTenantsPageState extends State<ResponsiveTenantsPage> {
  late Future<BaseModel<List<TenantModel>>> _getTenantFuture;

  var tenantId = TextEditingController();
  var tenantCorpName = TextEditingController();
  var tenantAdminEmail = TextEditingController();
  var tenantIssuer = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getTokenAndFetchTenants();
  }

  Future<void> _getTokenAndFetchTenants() async {
    setState(() {
      _getTenantFuture = TenantService.getTenants(
        TokenClass.me.token.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color(0xFF5F5FA7).withOpacity(0.6),
        backgroundColor: const Color(0xFF464667),
        appBar: AppBar(
          forceMaterialTransparency: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
              top: Radius.circular(
                  30), // Dilediğiniz yuvarlaklık oranını belirleyebilirsiniz
            ),
          ),
          elevation: 50,
          title: const Text(
            "Tenants ",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          centerTitle: true,
          actions: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Add new corporation'),
                      content: Form(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // email
                              buildTextFormFieldForId(),
                              const SizedBox(
                                height: 20,
                              ),
                              buildTextFormFieldForCorpName(),
                              const SizedBox(
                                height: 20,
                              ),
                              buildTextFormFieldAdminEmail(),
                              const SizedBox(
                                height: 20,
                              ),
                              buildTextFormFieldForIssuer(),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              TenantService.createTenant(
                                  TokenClass.me.token.toString(),
                                  tenantId.text,
                                  tenantCorpName.text,
                                  tenantAdminEmail.text,
                                  tenantIssuer.text);
                              _getTokenAndFetchTenants();
                            });
                            Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Tenants()),
                              (route) => false,
                            );
                            // Navigator.of(context).pop();
                          },
                          child: const Text('Add'),
                        ),
                      ],
                      icon: const Icon(Icons.person_add_alt),
                    );
                  },
                );
                setState(() {
                  // BURADA yeni tenant oluşturacaksın
                });
              },
              child: const Text(
                'New Corporation',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _getTokenAndFetchTenants();
                });
              },
              child: const Text(
                'Refresh Page',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
          ],
        ),
        body: FutureDataBuilder(getTenantFuture: _getTenantFuture));
  }

  TextFormField buildTextFormFieldForIssuer() {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.settings_input_svideo_sharp),
        labelText: "Issuer",
        hintText: "Issuer",
        labelStyle: TextStyle(
          color: Colors.black38,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      controller: tenantIssuer,
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  TextFormField buildTextFormFieldAdminEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        labelText: "Admin e-mail",
        hintText: "Admin e-mail",
        labelStyle: TextStyle(
          color: Colors.black38,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      controller: tenantAdminEmail,
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  TextFormField buildTextFormFieldForCorpName() {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
        labelText: "Corporation Name",
        hintText: "Corporation Name",
        labelStyle: TextStyle(
          color: Colors.black38,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      controller: tenantCorpName,
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  TextFormField buildTextFormFieldForId() {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person_outline_outlined),
        labelText: "Id",
        hintText: "Id",
        labelStyle: TextStyle(
          color: Colors.black38,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
      controller: tenantId,
      onChanged: (value) {
        setState(() {});
      },
    );
  }
}
