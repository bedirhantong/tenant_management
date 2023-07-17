import 'package:flutter/material.dart';
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
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Tenants ",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                // BURADA yeni tenant oluşturacaksın
              });
            },
            child: const Text(
              'CREATE',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _getTokenAndFetchTenants();
              });
            },
            child: const Text(
              'Refresh',
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
                return DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Id',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Name',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Admin Email',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Valid Upto',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Active',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Actions',
                          style: TextStyle(fontStyle: FontStyle.italic),
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
                        DataCell(Text(tenant.name ?? '')),
                        DataCell(Text(tenant.adminEmail ?? '')),
                        DataCell(Text(tenant.validUpto ?? '')),
                        DataCell(Text(tenant.isActive.toString() ?? '')),
                        DataCell(
                          DropdownButtonHideUnderline(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                customButton: const Icon(
                                  Icons.list,
                                  size: 46,
                                  color: Colors.blueGrey,
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
                                  width: 160,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.grey,
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
              title: Text('Bilgi Kutucuğu Başlığı'),
              content: Text('Bilgi Kutucuğu İçeriği'),
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
      case MenuItems.details:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Bilgi Kutucuğu Başlığı'),
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
      MenuItem(text: 'Show Tenant Details', icon: Icons.more_horiz);
  static const deactivate = MenuItem(
      text: 'Deactivate Tenant', icon: Icons.remove_circle_outline_rounded);

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
              content: const Text('Upgrade the subscription'),
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
      case MenuItems.details:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tenants Detail'),
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
