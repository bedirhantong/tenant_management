import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:tenant_manager/model/service_model/base_model.dart';
import 'package:tenant_manager/model/service_model/tenant_models/tenant_model.dart';
import 'package:tenant_manager/pages/manage_tenants/admin_profile.dart';
import 'package:tenant_manager/pages/manage_tenants/home.dart';
import 'package:tenant_manager/pages/subscription/account.dart';
import 'package:tenant_manager/pages/manage_tenants/responsive_tenants_page.dart';
import 'package:tenant_manager/pages/manage_tenants/settings.dart';
import 'package:tenant_manager/pages/subscription/update_subscription.dart';
import 'package:tenant_manager/service/tenant_service.dart';

import '../../consts/token_class.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

class Tenants extends StatefulWidget {
  const Tenants({Key? key}) : super(key: key);

  @override
  State<Tenants> createState() => _TenantsState();
}

class _TenantsState extends State<Tenants> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  // final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      drawer: ExampleSidebarX(controller: _controller),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(controller: _controller),
          Expanded(
            child: Center(
              child: _ScreensExample(
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
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
  int currentPage = 1; // Track the current page number
  int rowsPerPage = 10; // Define the number of rows per page
  var remainDay = "";
  var temp = "";

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
  }

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
            final startIndex = (currentPage - 1) * rowsPerPage;
            final endIndex = startIndex + rowsPerPage;
            final paginatedTenantList = tenantList.sublist(
              startIndex,
              endIndex < tenantList.length ? endIndex : tenantList.length,
            );

            final dataRows = paginatedTenantList.map((tenant) {
              return DataRow(
                cells: <DataCell>[
                  const DataCell(
                    Center(
                      child: Icon(
                        Icons.corporate_fare_rounded,
                        color: Color(0xFF2E2E48),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Text(
                        tenant.id ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Text(
                        tenant.name ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: Text(
                        tenant.adminEmail ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: TextButton(
                        child: Text(
                          tenant.validUpto ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          var diff = timeDiff(tenant.validUpto!);

                          temp = DateTime.parse(tenant.validUpto!)
                              .toIso8601String();

                          if (tenant.validUpto == '$diff days remaining') {
                            tenant.validUpto = temp;
                          } else {
                            if (diff <= 0) {
                              setState(() {
                                tenant.validUpto =
                                    'Expired'; // Geçerlilik süresi dolmuş
                              });
                            } else {
                              setState(() {
                                tenant.validUpto = '$diff days remaining'
                                    .toString(); // Güncel süre
                              });
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: TextButton(
                        child: Text(
                          tenant.isActive.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  DataCell(
                    Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            alignment: Alignment.center,
                            customButton: const Icon(
                              Icons.list,
                              size: 46,
                              color: Color(0xFF685BFF),
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
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFF2E2E48),
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
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList();

            final totalPages = (tenantList.length / rowsPerPage).ceil();

            return ListView(
              children: [
                Container(
                  // padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 45.0),
                  child: DataTable(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          30), // Köşeleri yuvarlak hale getirir
                      border: Border.all(
                          color: const Color(0xFF464667),
                          style: BorderStyle.solid),
                    ),
                    border: const TableBorder(
                      verticalInside: BorderSide(
                          color: Colors.white38, style: BorderStyle.none),
                      horizontalInside: BorderSide(
                          color: Colors.white38, style: BorderStyle.none),
                      right: BorderSide(
                        color: Colors.white38,
                        style: BorderStyle.none,
                      ),
                      left: BorderSide(
                        color: Colors.white38,
                        style: BorderStyle.none,
                      ),
                      bottom: BorderSide(
                          color: Colors.white38, style: BorderStyle.none),
                      top: BorderSide(
                          color: Colors.white38, style: BorderStyle.none),
                    ),
                    showBottomBorder: false,
                    sortAscending: true,
                    dividerThickness: 3.0,
                    columns: <DataColumn>[
                      DataColumn(
                        label: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              ' ',
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Id',
                              textAlign: TextAlign
                                  .center, // Metnin tam ortada olmasını sağlar
                              style: GoogleFonts.sourceSans3(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight
                                          .bold, // Metnin kalın (bold) olmasını sağlar
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Name',
                              textAlign: TextAlign
                                  .center, // Metnin tam ortada olmasını sağlar
                              style: GoogleFonts.sourceSans3(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight
                                          .bold, // Metnin kalın (bold) olmasını sağlar
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Admin Email',
                              textAlign: TextAlign
                                  .center, // Metnin tam ortada olmasını sağlar
                              style: GoogleFonts.sourceSans3(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight
                                          .bold, // Metnin kalın (bold) olmasını sağlar
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Valid Upto',
                              textAlign: TextAlign
                                  .center, // Metnin tam ortada olmasını sağlar
                              style: GoogleFonts.sourceSans3(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight
                                          .bold, // Metnin kalın (bold) olmasını sağlar
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Active',
                              textAlign: TextAlign
                                  .center, // Metnin tam ortada olmasını sağlar
                              style: GoogleFonts.sourceSans3(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight
                                          .bold, // Metnin kalın (bold) olmasını sağlar
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Actions',
                              textAlign: TextAlign
                                  .center, // Metnin tam ortada olmasını sağlar
                              style: GoogleFonts.sourceSans3(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight
                                          .bold, // Metnin kalın (bold) olmasını sağlar
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    rows: dataRows,
                  ),
                ),
                buildPagination(totalPages),
              ],
            );
          } else {
            return const Center(
              child: Text("no valid data"),
            );
          }
        } else {
          return const SizedBox(
            child: Text("the most else"),
          );
        }
      },
    );
  }

  Row buildPagination(int totalPages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: currentPage > 1
              ? () {
                  setState(() {
                    currentPage--;
                  });
                }
              : null,
          icon: const Icon(Icons.arrow_back, color: Colors.white12),
        ),
        Text(
          'Page $currentPage of $totalPages',
          style: const TextStyle(color: Colors.white),
        ),
        IconButton(
          onPressed: currentPage < totalPages
              ? () {
                  setState(() {
                    currentPage++;
                  });
                }
              : null,
          icon: const Icon(Icons.arrow_forward, color: Colors.white12),
        ),
      ],
    );
  }

  int timeDiff(String validUpto) {
    DateTime dateNow = DateTime.now();
    DateTime validUptoDate = DateTime.parse(validUpto);
    Duration difference = validUptoDate.difference(dateNow);
    int daysDifference = difference.inDays;

    return daysDifference;
  }

  void onChanged(MenuItem item, TenantModel tenant) {
    switch (item) {
      case MenuItems.upgrade:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const Account(),
        //   ),
        // );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Account(
              tenant: tenant,
            ),
          ),
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

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        // itemPadding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(30),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/logo/mavi_arge_logo.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            debugPrint('Home');
          },
        ),
        const SidebarXItem(
          icon: Icons.corporate_fare_outlined,
          label: 'Tenants',
        ),
        const SidebarXItem(
          icon: Icons.person,
          label: 'Admin profile',
        ),
        const SidebarXItem(
          icon: Icons.admin_panel_settings_outlined,
          label: 'Settings',
        )
      ],
    );
  }
}

class _ScreensExample extends StatefulWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  State<_ScreensExample> createState() => _ScreensExampleState();
}

class _ScreensExampleState extends State<_ScreensExample> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(widget.controller.selectedIndex);
        switch (widget.controller.selectedIndex) {
          case 0:
            return const HomePage();
          case 1:
            //tenants
            return const ResponsiveTenantsPage();
          case 2:
            //Create Tenant
            return const AdminProfile();
          case 3:
            //admin profile
            return const Settings();
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Tenants';
    case 2:
      return 'Admin profile';
    case 3:
      return 'Settings';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
