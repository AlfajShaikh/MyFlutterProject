import 'package:company_project/ExpanseData.dart';
import 'package:company_project/Utils.dart';
import 'package:company_project/constratanits.dart';
import 'package:company_project/textdialog.dart';
import 'package:company_project/user.dart';
import 'package:company_project/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

final columns = [
  'Expanse name',
  'Vendor name',
  'price',
  'date',
  'Payement Type'
];

class Expansemanagment extends StatefulWidget {
  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<Expansemanagment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput1 = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();
  late List<User> users;
  bool value = false;
  bool Expansename = true;
  int selectedIndex = -1;
  late Color color;
  bool deleteVisiable = false;
  bool buttunenabled = false;
  String? _chosenvalue, _chosenvalue1, _chosenvalue2;

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers);
    dateinput.text = "";
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Expanse managment",
            textAlign: TextAlign.center,
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                  icon: Icon(
                    Icons.paid,
                    color: Colors.black,
                  ),
                  text: "Paid"),
              Tab(
                icon: Icon(
                  Icons.pending,
                  color: Colors.black,
                ),
                text: "Dues",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Visibility(
                            visible: deleteVisiable,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                )
                              ],
                            ))
                      ],
                    ),
                    DataTable(
                        onSelectAll: (val) {
                          setState(() {
                            selectedIndex = -1;
                            deleteVisiable = false;
                          });
                        },
                        columns: [
                          DataColumn(label: Text("Expanse name")),
                          DataColumn(label: Text("Vendor name")),
                          DataColumn(label: Text("Price")),
                          DataColumn(label: Text("      Date")),
                          DataColumn(label: Text("Payement type")),
                        ],
                        rows: [
                          DataRow(
                              selected: 0 == selectedIndex,
                              onSelectChanged: (val) {
                                setState(() {
                                  selectedIndex = 0;
                                  deleteVisiable = true;
                                });
                              },
                              cells: [
                                DataCell(
                                  Text("ABXs"),
                                  onTap: () {
                                    color = Colors.lightBlue;
                                  },
                                ),
                                DataCell(
                                  Text("SCsS"),
                                  onTap: () {
                                    color = Colors.lightBlue;
                                  },
                                ),
                                DataCell(
                                  Text("400"),
                                  onTap: () {
                                    color = Colors.lightBlue;
                                  },
                                ),
                                DataCell(
                                  TextField(
                                    controller: dateinput,
                                    onTap: () async {
                                      DateTime? pickeddate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );
                                      if (pickeddate != null) {
                                        print(pickeddate);
                                        String formatdate =
                                            DateFormat("yyyy-MM-dd")
                                                .format(pickeddate);
                                        print(formatdate);
                                        setState(() {
                                          dateinput.text = formatdate;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.edit),
                                        hintText: '2022-02-12'),
                                  ),
                                ),
                                DataCell(
                                  Text("Cash"),
                                  onTap: () {
                                    color = Colors.lightBlue;
                                  },
                                ),
                              ]),
                          DataRow(
                            selected: 1 == selectedIndex,
                            onSelectChanged: (val) {
                              setState(() {
                                selectedIndex = 1;
                                deleteVisiable = true;
                              });
                            },
                            cells: [
                              DataCell(
                                Text("SDCX"),
                              ),
                              DataCell(
                                Text("SCDS"),
                              ),
                              DataCell(
                                Text("500"),
                              ),
                              DataCell(
                                TextField(
                                  controller: dateinput1,
                                  onTap: () async {
                                    DateTime? pickeddate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101),
                                    );
                                    if (pickeddate != null) {
                                      print(pickeddate);
                                      String formatdate =
                                          DateFormat("yyyy-MM-dd")
                                              .format(pickeddate);
                                      print(formatdate);
                                      setState(() {
                                        dateinput.text = formatdate;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.edit),
                                      border: InputBorder.none,
                                      hintText: '2022-03/23'),
                                ),
                              ),
                              DataCell(
                                Text("UPI"),
                                onTap: () {
                                  color = Colors.lightBlue;
                                },
                              ),
                            ],
                          ),
                          DataRow(
                            selected: 2 == selectedIndex,
                            onSelectChanged: (val) {
                              setState(() {
                                selectedIndex = 2;
                              });
                            },
                            cells: [
                              DataCell(
                                Text("RXS"),
                              ),
                              DataCell(
                                Text("SXSD"),
                              ),
                              DataCell(
                                Text("1500"),
                              ),
                              DataCell(
                                TextField(
                                  controller: dateinput2,
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickeddate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101),
                                    );
                                    if (pickeddate != null) {
                                      print(pickeddate);
                                      String formatdate =
                                          DateFormat("yyyy-MM-dd")
                                              .format(pickeddate);
                                      print(formatdate);
                                      setState(() {
                                        dateinput.text = formatdate;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.edit),
                                      border: InputBorder.none,
                                      hintText: '2021-05-14'),
                                ),
                              ),
                              DataCell(
                                Text("CARD"),
                                onTap: () {
                                  color = Colors.lightBlue;
                                },
                              ),
                            ],
                          )
                        ]),
                  ],
                )),
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "Add Data",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ExpanseData();
                            }));
                          },
                          icon: Icon(
                            Icons.add,
                          ),
                        ),
                      ],
                    ),

                    //second Datatable.......................
                    Row(
                      children: [
                        Visibility(
                            visible: deleteVisiable,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                )
                              ],
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        DataTable(
                            onSelectAll: (val) {
                              setState(() {
                                selectedIndex = -1;
                                deleteVisiable = false;
                              });
                            },
                            columns: [
                              DataColumn(label: Text("Expanse name")),
                              DataColumn(label: Text("Vendor name")),
                              DataColumn(label: Text("Price")),
                              DataColumn(label: Text("      Date")),
                              DataColumn(label: Text("Payement type")),
                              DataColumn(label: Text("Payement categaries")),
                            ],
                            rows: [
                              DataRow(
                                  selected: 0 == selectedIndex,
                                  onSelectChanged: (val) {
                                    setState(() {
                                      selectedIndex = 0;
                                      deleteVisiable = true;
                                    });
                                  },
                                  cells: [
                                    DataCell(Visibility(
                                      visible: Expansename,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                color = Colors.lightBlue;
                                              },
                                              child: Text("ABXs")),
                                        ],
                                      ),
                                    )),
                                    DataCell(
                                      Text("SCsS"),
                                      onTap: () {
                                        color = Colors.lightBlue;
                                      },
                                    ),
                                    DataCell(
                                      Text("400"),
                                      onTap: () {
                                        color = Colors.lightBlue;
                                      },
                                    ),
                                    DataCell(
                                      TextField(
                                        controller: dateinput,
                                        onTap: () async {
                                          DateTime? pickeddate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2101),
                                          );
                                          if (pickeddate != null) {
                                            print(pickeddate);
                                            String formatdate =
                                                DateFormat("yyyy-MM-dd")
                                                    .format(pickeddate);
                                            print(formatdate);
                                            setState(() {
                                              dateinput.text = formatdate;
                                            });
                                          }
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: Icon(Icons.edit),
                                            hintText: '2022-02-12'),
                                      ),
                                    ),
                                    DataCell(
                                      Text("Cash"),
                                      onTap: () {
                                        color = Colors.lightBlue;
                                      },
                                    ),
                                    DataCell(
                                      DropdownButton<String>(
                                          focusColor: kprimarycolor,
                                          value: _chosenvalue,
                                          items: <String>["Paid", "Dues"]
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          hint: Text("Paid "),
                                          borderRadius:
                                              BorderRadius.circular(23),
                                          onChanged: (String? value) {
                                            setState(() {
                                              _chosenvalue = value;
                                            });
                                          }),
                                    )
                                  ]),
                              DataRow(
                                selected: 1 == selectedIndex,
                                onSelectChanged: (val) {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                },
                                cells: [
                                  DataCell(
                                    Text("SDCX"),
                                  ),
                                  DataCell(
                                    Text("SCDS"),
                                  ),
                                  DataCell(
                                    Text("500"),
                                  ),
                                  DataCell(
                                    TextField(
                                      controller: dateinput1,
                                      onTap: () async {
                                        DateTime? pickeddate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101),
                                        );
                                        if (pickeddate != null) {
                                          print(pickeddate);
                                          String formatdate =
                                              DateFormat("yyyy-MM-dd")
                                                  .format(pickeddate);
                                          print(formatdate);
                                          setState(() {
                                            dateinput.text = formatdate;
                                          });
                                        }
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.edit),
                                          border: InputBorder.none,
                                          hintText: '2022-03/23'),
                                    ),
                                  ),
                                  DataCell(
                                    Text("UPI"),
                                    onTap: () {
                                      color = Colors.lightBlue;
                                    },
                                  ),
                                  DataCell(
                                    DropdownButton<String>(
                                        focusColor: kprimarycolor,
                                        value: _chosenvalue1,
                                        items: <String>["Paid", "Dues"]
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        hint: Text("Paid"),
                                        borderRadius: BorderRadius.circular(23),
                                        onChanged: (String? value) {
                                          setState(() {
                                            _chosenvalue1 = value;
                                          });
                                        }),
                                  )
                                ],
                              ),
                              DataRow(
                                selected: 2 == selectedIndex,
                                onSelectChanged: (val) {
                                  setState(() {
                                    selectedIndex = 2;
                                  });
                                },
                                cells: [
                                  DataCell(
                                    Text("RXS"),
                                  ),
                                  DataCell(
                                    Text("SXSD"),
                                  ),
                                  DataCell(
                                    Text("1500"),
                                  ),
                                  DataCell(
                                    TextField(
                                      controller: dateinput2,
                                      readOnly: true,
                                      onTap: () async {
                                        DateTime? pickeddate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101),
                                        );
                                        if (pickeddate != null) {
                                          print(pickeddate);
                                          String formatdate =
                                              DateFormat("yyyy-MM-dd")
                                                  .format(pickeddate);
                                          print(formatdate);
                                          setState(() {
                                            dateinput.text = formatdate;
                                          });
                                        }
                                      },
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.edit),
                                          border: InputBorder.none,
                                          hintText: '2021-05-14'),
                                    ),
                                  ),
                                  DataCell(
                                    Text("CARD"),
                                    onTap: () {
                                      color = Colors.lightBlue;
                                    },
                                  ),
                                  DataCell(
                                    DropdownButton<String>(
                                        focusColor: kprimarycolor,
                                        value: _chosenvalue2,
                                        items: <String>["Paid", "Dues"]
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        hint: Text("Dues "),
                                        borderRadius: BorderRadius.circular(23),
                                        onChanged: (String? value) {
                                          setState(() {
                                            _chosenvalue2 = value;
                                          });
                                        }),
                                  )
                                ],
                              )
                            ]),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [
          user.firstName,
          user.lastName,
          user.age,
          user.firstName1,
          user.lastName1
        ];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 0 || index == 1;

            return DataCell(
              Text('$cell'),
            );
          }),
        );
      }).toList();

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isAge = column == columns[2];

      return DataColumn(
        label: Text(column),
        numeric: isAge,
      );
    }).toList();
  }

  //Second table
  List<DataRow> getRows1(List<User> users) => users.map((User user) {
        final cells = [
          user.firstName,
          user.lastName,
          user.age,
          user.firstName1,
          user.lastName1
        ];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 3;

            return DataCell(
              Text('$cell' ""),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 3:
                    editFirstName1(user);

                    setState(() {
                      index = 1;
                    });
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  List<DataColumn> getColumns1(List<String> columns) {
    return columns.map((String column) {
      final isAge = column == columns[2];

      return DataColumn(
        label: Text(column),
        numeric: isAge,
      );
    }).toList();
  }

  Future editFirstName1(User editUser) async {
    final firstName = await showTextDialog(
      context,
      title: 'Change date',
      value: editUser.firstName1,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(firstName1: firstName) : user;
        }).toList());
  }
}
