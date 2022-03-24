import 'dart:core';

import 'package:company_project/constratanits.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int SMSCount = 0;

class BrandBuilderpage extends StatefulWidget {
  const BrandBuilderpage({Key? key}) : super(key: key);

  @override
  _BrandBuilderpageState createState() => _BrandBuilderpageState();
}

class _BrandBuilderpageState extends State<BrandBuilderpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: brandbuilderbody(),
    );
  }
}

class brandbuilderbody extends StatefulWidget {
  const brandbuilderbody({Key? key}) : super(key: key);

  @override
  _brandbuilderbodyState createState() => _brandbuilderbodyState();
}

class _brandbuilderbodyState extends State<brandbuilderbody> {
  TextEditingController dateinput = TextEditingController();
  final Messagebox = TextEditingController();

  int count = 0;
  int char = 0;

  DateTime? dateTime;

  _onChanged(String value) {
    setState(() {
      char = (value.length);
      count = (value.length) ~/ 160;
    });
  }

  String getText() {
    if (dateTime == null) {
      return DateFormat("MM/dd/yyyy HH:mm")
          .format(DateTime.utc(2022, 2, 24, 11, 29, 60));
    } else {
      return DateFormat("MM/dd/yyyy HH:mm").format(dateTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Brand builder",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 7,
            ),
            Image.asset(
              "assets/brand.png",
              height: size.height * 0.19,
            ),
            SizedBox(
              height: 10,
            ),
            MessageTextField(
              child: TextFormField(
                onChanged: _onChanged,
                controller: Messagebox,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.message,
                    color: kprimarycolor,
                  ),
                  hintText: "Message",
                  border: InputBorder.none,
                ),
              ),
            ),
            Column(
              children: [
                Text("SMS count :$count",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.red))
              ],
            ),
            TextFieldContainer(
              child: TextField(
                readOnly: true,
                onTap: () {
                  pickDateTime(context);
                },
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.calendar_today,
                      color: kprimarycolor,
                    ),
                    hintText: getText(),
                    border: InputBorder.none),
              ),
            ),
            const TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.task,
                      color: kprimarycolor,
                    ),
                    hintText: "Remarks (If any)",
                    border: InputBorder.none),
              ),
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
                      SMScount();
                    },
                    child: const Text(
                      "Submit ",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      dateTime =
          DateTime(date.year, date.month, date.day, time.hour, time.minute);
    });
  }

  Future pickDate(BuildContext context) async {
    final initialdate = DateTime.now();

    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? initialdate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate == null) return null;
    return newDate;
  }

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 11, minute: 30);
    final newTime = await showTimePicker(
        context: context,
        initialTime: dateTime != null
            ? TimeOfDay(hour: dateTime!.hour, minute: dateTime!.minute)
            : initialTime);

    if (newTime == null) return null;
    return newTime;
  }

  void SMScount() {
    setState(() {
      SMSCount++;
    });
  }
}

//Message Box Field

class MessageTextField extends StatelessWidget {
  final Widget child;
  const MessageTextField({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      height: size.height * 0.2,
      decoration: BoxDecoration(
          color: kprimarylightcolor, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}

// Calender Class
class TextFieldReminder extends StatelessWidget {
  final Widget child;
  const TextFieldReminder({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kprimarylightcolor, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kprimarylightcolor, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}

//Alert Box
showAlertDialog(BuildContext context) {
  Widget okbutton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
      SMSCount = SMSCount + 1;
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Only 160 Character accepted...!"),
    actions: [
      okbutton,
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
