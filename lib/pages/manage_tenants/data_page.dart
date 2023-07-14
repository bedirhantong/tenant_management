import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late List<DatatableHeader> _headers;

  final List<int> _perPages = [10, 20, 50, 100];
  int _total = 100;
  int? _currentPerPage = 10;
  List<bool>? _expanded;
  String? _searchKey = "id";

  int _currentPage = 1;
  bool _isSearch = false;
  final List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  final String _selectableKey = "id";

  String? _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  final bool _showSelect = true;
  var random = Random();

  List<Map<String, dynamic>> _generateData({int n = 10}) {
    final List source = List.filled(n, Random.secure());
    List<Map<String, dynamic>> temps = [];
    var i = 1;
    print(i);
    // ignore: unused_local_variable
    for (var data in source) {
      temps.add({
        "id": i,
        "name": "$i",
        "email": "$i@gmail.com",
        "upto": "$i March 2020",
        "active": i * 10.00,
        "actions": "active",
      });
      i++;
    }
    return temps;
  }

  _initializeData() async {
    _mockPullData();
  }

  _mockPullData() async {
    _expanded = List.generate(_currentPerPage!, (index) => false);

    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2)).then((value) {
      _sourceOriginal.clear();
      _sourceOriginal.addAll(_generateData(n: random.nextInt(100)));
      _sourceFiltered = _sourceOriginal;
      _total = _sourceFiltered.length;
      _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
      setState(() => _isLoading = false);
    });
  }

  _resetData({start = 0}) async {
    setState(() => _isLoading = true);
    var expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(const Duration(seconds: 0)).then((value) {
      _expanded = List.generate(expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + expandedLen).toList();
      setState(() => _isLoading = false);
    });
  }

  _filterData(value) {
    setState(() => _isLoading = true);

    try {
      if (value == "" || value == null) {
        _sourceFiltered = _sourceOriginal;
      } else {
        _sourceFiltered = _sourceOriginal
            .where((data) => data[_searchKey!]
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }

      _total = _sourceFiltered.length;
      var rangeTop = _total < _currentPerPage! ? _total : _currentPerPage!;
      _expanded = List.generate(rangeTop, (index) => false);
      _source = _sourceFiltered.getRange(0, rangeTop).toList();
    } catch (e) {
      print(e);
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();

    /// set headers
    _headers = [
      DatatableHeader(
          text: "ID",
          value: "id",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Name",
          value: "name",
          show: true,
          flex: 2,
          sortable: true,
          editable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Admin Email",
          value: "email",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Valid Upto",
          value: "upto",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Active",
          value: "active",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "Actions",
          value: "actions",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
    ];

    _initializeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(0),
      constraints: const BoxConstraints(
        maxHeight: 650,
      ),
      child: Card(
        elevation: 1,
        shadowColor: Colors.black,
        clipBehavior: Clip.none,
        child: ResponsiveDatatable(
          title: TextButton.icon(
            onPressed: () => {},
            icon: const Icon(Icons.add),
            label: const Text("CREATE"),
          ),
          reponseScreenSizes: const [ScreenSize.xs],
          actions: [
            if (_isSearch)
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    hintText:
                        'Enter search term based on ${_searchKey!.replaceAll(RegExp('[\\W_]+'), ' ').toUpperCase()}',
                    prefixIcon: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          setState(() {
                            _isSearch = false;
                          });
                          _initializeData();
                        }),
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.search), onPressed: () {})),
                onSubmitted: (value) {
                  _filterData(value);
                },
              )),
            if (!_isSearch)
              IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearch = true;
                    });
                  })
          ],
          headers: _headers,
          source: _source,
          selecteds: _selecteds,
          showSelect: _showSelect,
          autoHeight: false,
          dropContainer: (data) {
            if (int.tryParse(data['id'].toString())!.isEven) {
              return const Text("is Even");
            }
            return _DropDownContainer(data: data);
          },
          onChangedRow: (value, header) {
            /// print(value);
            /// print(header);
          },
          onSubmittedRow: (value, header) {
            /// print(value);
            /// print(header);
          },
          onTabRow: (data) {
            print(data);
          },
          onSort: (value) {
            setState(() => _isLoading = true);

            setState(() {
              _sortColumn = value;
              _sortAscending = !_sortAscending;
              if (_sortAscending) {
                _sourceFiltered.sort(
                    (a, b) => b["$_sortColumn"].compareTo(a["$_sortColumn"]));
              } else {
                _sourceFiltered.sort(
                    (a, b) => a["$_sortColumn"].compareTo(b["$_sortColumn"]));
              }
              var rangeTop = _currentPerPage! < _sourceFiltered.length
                  ? _currentPerPage!
                  : _sourceFiltered.length;
              _source = _sourceFiltered.getRange(0, rangeTop).toList();
              _searchKey = value;

              _isLoading = false;
            });
          },
          expanded: _expanded,
          sortAscending: _sortAscending,
          sortColumn: _sortColumn,
          isLoading: _isLoading,
          onSelect: (value, item) {
            if (value!) {
              setState(() => _selecteds.add(item));
            } else {
              setState(() => _selecteds.removeAt(_selecteds.indexOf(item)));
            }
          },
          onSelectAll: (value) {
            if (value!) {
              setState(() =>
                  _selecteds = _source.map((entry) => entry).toList().cast());
            } else {
              setState(() => _selecteds.clear());
            }
          },
          footers: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text("Rows per page:"),
            ),
            if (_perPages.isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: DropdownButton<int>(
                  value: _currentPerPage,
                  items: _perPages
                      .map((e) => DropdownMenuItem<int>(
                            child: Text("$e"),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (dynamic value) {
                    setState(() {
                      _currentPerPage = value;
                      _currentPage = 1;
                      _resetData();
                    });
                  },
                  isExpanded: false,
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text("$_currentPage - $_currentPerPage of $_total"),
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 16,
              ),
              onPressed: _currentPage == 1
                  ? null
                  : () {
                      var nextSet0 = _currentPage - _currentPerPage!;
                      setState(() {
                        _currentPage = nextSet0 > 1 ? nextSet0 : 1;
                        _resetData(start: _currentPage - 1);
                      });
                    },
              padding: const EdgeInsets.symmetric(horizontal: 15),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 16),
              onPressed: _currentPage + _currentPerPage! - 1 > _total
                  ? null
                  : () {
                      var nextSet = _currentPage + _currentPerPage!;

                      setState(() {
                        _currentPage = nextSet < _total
                            ? nextSet
                            : _total - _currentPerPage!;
                        _resetData(start: nextSet - 1);
                      });
                    },
              padding: const EdgeInsets.symmetric(horizontal: 15),
            )
          ],
        ),
      ),
    );
  }
}

class _DropDownContainer extends StatelessWidget {
  final Map<String, dynamic> data;
  const _DropDownContainer({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = data.entries.map<Widget>((entry) {
      Widget w = Row(
        children: [
          Text(entry.key.toString()),
          const Spacer(),
          Text(entry.value.toString()),
        ],
      );
      return w;
    }).toList();

    return Container(
      child: Column(
        children: children,
      ),
    );
  }
}
