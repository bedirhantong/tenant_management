import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tenant_manager/model/service_model/base_model.dart';
import 'package:tenant_manager/model/service_model/tenant_models/tenant_model.dart';
import 'package:tenant_manager/service/tenant_service.dart';

import '../../consts/token_class.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

class Tenants extends StatefulWidget {
  const Tenants({Key? key}) : super(key: key);

  @override
  State<Tenants> createState() => _TenantsState();
}

class _TenantsState extends State<Tenants> {
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
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: const Text(
          "Tenants ",
          style: TextStyle(color: Colors.white),
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
                          Navigator.of(context).pop();
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
      body: FutureDataBuilder(getTenantFuture: _getTenantFuture),
    );
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

class FutureDataBuilder extends StatefulWidget {
  const FutureDataBuilder({
    super.key,
    required Future<BaseModel<List<TenantModel>>> getTenantFuture,
  }) : _getTenantFuture = getTenantFuture;

  final Future<BaseModel<List<TenantModel>>> _getTenantFuture;

  @override
  State<FutureDataBuilder> createState() => _FutureDataBuilderState();
}

class _FutureDataBuilderState extends State<FutureDataBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BaseModel<List<TenantModel>>>(
      future: widget._getTenantFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData && snapshot.data!.suc) {
          final tenantList = snapshot.data!.data!;
          if (tenantList.isNotEmpty) {
            return ListView.builder(
              itemCount: tenantList.length,
              itemBuilder: (context, index) {
                final tenant = tenantList[index];
                return Container(
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(10.0),
                  child: DataTable(
                    border: const TableBorder(
                      horizontalInside: BorderSide(
                          color: Colors.red, style: BorderStyle.solid),
                      left: BorderSide(
                          color: Colors.red, style: BorderStyle.solid),
                    ),
                    dividerThickness: double.infinity,
                    showBottomBorder: true,
                    sortAscending: true,
                    columns: <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Container(
                            width: 100,
                            height: 50,
                            child: Text(
                              'Id',
                              style: GoogleFonts.robotoMono(
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Container(
                            width: 100,
                            height: 50,
                            child: Text(
                              'Name',
                              style: GoogleFonts.robotoMono(
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Container(
                            width: 100,
                            height: 50,
                            child: Text(
                              'Admin Email',
                              style: GoogleFonts.robotoMono(
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Container(
                            width: 100,
                            height: 50,
                            child: Text(
                              'Valid Upto',
                              style: GoogleFonts.robotoMono(
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Container(
                            width: 100,
                            height: 50,
                            child: Text(
                              'Active',
                              style: GoogleFonts.robotoMono(
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Container(
                            width: 100,
                            height: 50,
                            child: Text(
                              'Actions',
                              style: GoogleFonts.robotoMono(
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall),
                            ),
                          ),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(tenant.id ?? ''),
                          ),
                          DataCell(
                            Text(tenant.name ?? ''),
                          ),
                          DataCell(
                            Text(tenant.adminEmail ?? ''),
                          ),
                          DataCell(
                            TextButton(
                                child: Text(tenant.validUpto ?? ''),
                                onPressed: () {}),
                          ),
                          DataCell(
                            // tenant.isActive
                            TextButton(
                                child: Text(tenant.isActive.toString()),
                                onPressed: () {}),
                          ),
                          DataCell(
                            DropdownButtonHideUnderline(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  customButton: const Icon(
                                    Icons.list,
                                    size: 46,
                                    color: Colors.green,
                                  ),
                                  items: [
                                    ...MenuItems.firstItems.map(
                                      (item) => DropdownMenuItem<MenuItem>(
                                        value: item,
                                        child: MenuItems.buildItem(item),
                                      ),
                                    ),
                                    const DropdownMenuItem<Divider>(
                                        enabled: false, child: Divider()),
                                    ...MenuItems.secondItems.map(
                                      (item) => DropdownMenuItem<MenuItem>(
                                        value: item,
                                        child: MenuItems.buildItem(item),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    onChanged(value! as MenuItem, tenant);
                                  },
                                  dropdownStyleData: DropdownStyleData(
                                    width: 250,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.green.shade400,
                                    ),
                                    offset: const Offset(0, 8),
                                  ),
                                  menuItemStyleData: MenuItemStyleData(
                                    customHeights: [
                                      ...List<double>.filled(
                                          MenuItems.firstItems.length, 48),
                                      8,
                                      ...List<double>.filled(
                                          MenuItems.secondItems.length, 48),
                                    ],
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Data yok"),
            );
          }
        } else {
          return const SizedBox(
            child: Text("en else olan"),
          );
        }
      },
    );
  }

  void onChanged(MenuItem item, TenantModel tenant) {
    switch (item) {
      case MenuItems.upgrade:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Upgrade the subscription'),
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    DateTime dateNow = DateTime.now();
                    final DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: dateNow,
                      firstDate: dateNow,
                      lastDate: DateTime(2030),
                    );
                    if (selectedDate != null) {
                      TenantService.updateTenantSubscription(
                              TokenClass.me.token.toString(),
                              tenant.id.toString(),
                              selectedDate)
                          .then(
                        (v) {
                          tenant.validUpto = selectedDate.toIso8601String();
                        },
                      );
                    }
                  },
                  child: const Text("Pick a date"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: const Text('Update the expire date'),
                ),
              ],
              icon: const Icon(Icons.update),
            );
          },
        );
        break;
      case MenuItems.details:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Details'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${tenant.id}'),
                  Text('Name: ${tenant.name}'),
                  Text('Admin Email: ${tenant.adminEmail}'),
                  Text('Valid Upto: ${tenant.validUpto}'),
                  Text('Active: ${tenant.isActive.toString()}'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Kapat'),
                ),
              ],
              icon: const Icon(Icons.refresh),
            );
          },
        );
        break;
      case MenuItems.deactivate:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Deactivation'),
              content: const Text('Sure deactivation?'),
              actions: [
                TextButton(
                  onPressed: () {
                    TenantService.getTenantsActivation(
                      tenant.id!, // Tenant ID'sini kullanıyoruz
                      TokenClass.me.token.toString(),
                      tenant.isActive!,
                    ).whenComplete(() {
                      setState(() {
                        tenant.isActive = !tenant.isActive!;
                      });
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes I am'),
                ),
              ],
              icon: const Icon(Icons.refresh),
            );
          },
        );
        break;
    }
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [upgrade, details];
  static const List<MenuItem> secondItems = [deactivate];

  static const upgrade =
      MenuItem(text: 'Upgrade Subscription', icon: Icons.upgrade);
  static const details =
      MenuItem(text: 'Show Tenant Details', icon: Icons.more_vert_sharp);
  static const deactivate =
      MenuItem(text: 'Deactivate Tenant', icon: Icons.disabled_visible_sharp);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(
      BuildContext context, MenuItem item, TenantModel tenant) {
    switch (item) {
      case MenuItems.upgrade:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Upgrade the subscription'),
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    DateTime selectedDate = DateTime.now();
                    final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: selectedDate,
                      lastDate: DateTime(2030),
                    );
                    if (dateTime != null) {
                      TenantService.updateTenantSubscription(tenant.id!,
                              TokenClass.me.token.toString(), selectedDate)
                          .then(
                        (v) {
                          tenant.validUpto = selectedDate.toString();
                        },
                      );
                    }
                  },
                  child: const Text("Pick a date"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Update the expire date'),
                ),
              ],
              icon: const Icon(Icons.update),
            );
          },
        );
        break;
      case MenuItems.details:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Tenants Detail'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${tenant.id}'),
                  Text('Name: ${tenant.name}'),
                  Text('Admin Email: ${tenant.adminEmail}'),
                  Text('Valid Upto: ${tenant.validUpto}'),
                  Text('Active: ${tenant.isActive.toString()}'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
              icon: const Icon(Icons.refresh),
            );
          },
        );
        break;
      case MenuItems.deactivate:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Deactivation'),
              content: const Text('Sure deactivation?'),
              actions: [
                TextButton(
                  onPressed: () {
                    TenantService.getTenantsActivation(
                      tenant.id!, // Tenant ID'sini kullanıyoruz
                      TokenClass.me.token.toString(),
                      tenant.isActive!,
                    ).whenComplete(() {
                      tenant.isActive = !tenant.isActive!;
                    });
                    Navigator.of(context).pop();
                  },
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Yes I am'),
                  ),
                ),
              ],
              icon: const Icon(Icons.refresh),
            );
          },
        );
        break;
    }
  }
}
