import 'package:company_project/constratanits.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

bool visibilityTableRow = false;

class BusinessInsight extends StatefulWidget {
  const BusinessInsight({Key? key}) : super(key: key);

  @override
  _BusinessInsightState createState() => _BusinessInsightState();
}

class _BusinessInsightState extends State<BusinessInsight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReportModule(),
    );
  }
}

enum Days { Today, Yestarday, Other }

class ReportModule extends StatefulWidget {
  const ReportModule({Key? key}) : super(key: key);

  @override
  _ReportModuleState createState() => _ReportModuleState();
}

class _ReportModuleState extends State<ReportModule> {
  TextEditingController calenderinput = TextEditingController();
  TextEditingController calenderinputsecond = TextEditingController();
  int tcount = 1, tsum = 2, csum = 200, cardsum = 400, osum = 4;
  String name = "XYZ sb",
      mobilenumber = "42445454464",
      subtotal = "200",
      billdesc = "20",
      loyality = "20",
      ttldics = "40",
      totaltask = "100",
      netammount = "200",
      paid = "200",
      paytype = "cash",
      note = "ABX",
      timestamp = "1.50";
  Days _days = Days.Today;
  String? _Chosenvalue;
  bool isbuttonactive = false;
  @override
  Widget build(BuildContext context) {
    void initState() {
      calenderinput.text = "";

      super.initState();
    }

    void _changed() {
      setState(() {
        if (visibilityTableRow) {
          visibilityTableRow = false;
        } else {
          visibilityTableRow = true;
        }
      });
    }

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Business Insight",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/idea.png",
                  height: size.height * 0.2,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        value: Days.Today,
                        groupValue: _days,
                        onChanged: (Days? value) {
                          setState(() {
                            _days = value!;
                            isbuttonactive = false;
                            calenderinput.text = "";
                            calenderinputsecond.text = "";
                          });
                        }),
                    Text("Today"),
                    Radio(
                        value: Days.Yestarday,
                        groupValue: _days,
                        onChanged: (Days? value) {
                          setState(() {
                            _days = value!;
                            isbuttonactive = false;
                            calenderinput.text = "";
                            calenderinputsecond.text = "";
                          });
                        }),
                    Text("Yesterday"),
                    GestureDetector(
                      child: Radio(
                          value: Days.Other,
                          groupValue: _days,
                          onChanged: (Days? value) {
                            setState(() {
                              _days = value!;
                              isbuttonactive = true;
                            });
                          }),
                    ),
                    Text("Other"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFileldCalenders(
                      child: TextField(
                        enabled: isbuttonactive,
                        controller: calenderinput,
                        onTap: () async {
                          DateTime? pickdate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickdate != null) {
                            String formatdate =
                                DateFormat("yyyy-MM-dd").format(pickdate);
                            print(formatdate);
                            setState(() {
                              calenderinput.text = formatdate;
                            });
                          }
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.calendar_today,
                              color: kprimarycolor,
                            ),
                            hintText: "Calender",
                            border: InputBorder.none),
                      ),
                    ),
                    TextFileldCalenders(
                      child: TextField(
                        enabled: isbuttonactive,
                        controller: calenderinputsecond,
                        onTap: () async {
                          DateTime? pickdate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickdate != null) {
                            String formatdate =
                                DateFormat("yyyy-MM-dd").format(pickdate);
                            print(formatdate);
                            setState(() {
                              calenderinputsecond.text = formatdate;
                            });
                          }
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.calendar_today,
                              color: kprimarycolor,
                            ),
                            hintText: "Calender",
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        color: kprimarycolor,
                        onPressed: () {
                          _changed();
                        },
                        child: const Text(
                          "Submit ",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: size.width * 2,
                    child: Table(
                      children: [
                        if (visibilityTableRow)
                          TableRow(children: [
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text('Transaction count: $tcount'),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text('Transaction sum : $tsum'),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text('Cash sum : $csum'),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text('Card sum  $cardsum:'),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text('Other sum  $osum:'),
                              ),
                            ])),
                          ])
                        else
                          new TableRow(children: [
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                          ]),
                      ],
                    ),
                  ),
                ),

                //Display Table
                SizedBox(
                  height: 20,
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: size.width * 4,
                    child: Table(
                      border: TableBorder.all(width: 1.0, color: Colors.black),
                      children: [
                        if (visibilityTableRow)
                          TableRow(children: [
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '            Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '     Mobile number',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '         Sub total',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           Bill disc',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           Loyality',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           TTL disc',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           Total tax',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '       Net ammount',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '              Paid',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '          Pay type',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text('               Note',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           Timestamp',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ])),
                          ]),

                        //second visiblity Row
                        if (visibilityTableRow)
                          TableRow(children: [
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '            $name',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '     $mobilenumber',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '         $subtotal',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           $billdesc',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           $loyality',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           $ttldics',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           $totaltask',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '       $netammount',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '              $paid',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '          $paytype',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '               $note',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           $timestamp',
                                ),
                              ),
                            ])),
                          ]),
                        if (visibilityTableRow)
                          TableRow(children: [
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '            ABC Sb',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '     4557548754',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '         10',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           40',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           10',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           200',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           20',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '       $netammount',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '              6000',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '          UPI',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '               XSDC',
                                ),
                              ),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: new Text(
                                  '           12.00',
                                ),
                              ),
                            ])),
                          ])
                        else
                          new TableRow(children: [
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                            TableCell(
                                child: Row(children: <Widget>[
                              new Container(),
                            ])),
                          ]),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFileldCalenders extends StatelessWidget {
  final Widget child;
  const TextFileldCalenders({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 1 / 2.30,
      decoration: BoxDecoration(
          color: kprimarylightcolor, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
