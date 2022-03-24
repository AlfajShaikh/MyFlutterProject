import 'dart:math';

import 'package:company_project/Signupscreen.dart';
import 'package:company_project/constratanits.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum gendergroup { male, female }

class LoyalityPage extends StatefulWidget {
  const LoyalityPage({Key? key}) : super(key: key);

  @override
  _LoyalityPageState createState() => _LoyalityPageState();
}

class _LoyalityPageState extends State<LoyalityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Loyalitybody(),
    );
  }
}

enum Bestsite { one, two, three }

class Loyalitybody extends StatefulWidget {
  const Loyalitybody({Key? key}) : super(key: key);

  @override
  _LoyalitybodyState createState() => _LoyalitybodyState();
}

class _LoyalitybodyState extends State<Loyalitybody> {
  TextEditingController dateinput = TextEditingController();
  Bestsite _site = Bestsite.one;
  String? _chosenvalue;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void initState() {
      dateinput.text = "";
      super.initState();
    }

    return Container(
      height: size.height,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.08),
            Text(
              "Loyality bill",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: size.height * 0.01),
            Image.asset(
              "assets/credit-card.png",
              height: size.height * 0.20,
            ),
            SizedBox(height: size.height * 0.03),
            const TextFieldContainer(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone_android_rounded,
                      color: kprimarycolor,
                    ),
                    hintText: "Enter mobile number",
                    border: InputBorder.none),
              ),
            ),
            const TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kprimarycolor,
                    ),
                    hintText: "Username",
                    border: InputBorder.none),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size(90, 35),
                      textStyle: TextStyle(fontSize: 15),
                      primary: Colors.orange),
                  child: Text("Optic info"),
                  onPressed: () {},
                )),
                Container(
                    child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size(90, 35),
                      textStyle: TextStyle(fontSize: 15),
                      primary: Colors.orange),
                  child: Text("KYC"),
                  onPressed: () {},
                )),
                Container(
                    child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size(90, 35),
                      textStyle: TextStyle(fontSize: 15),
                      primary: Colors.orange),
                  child: Text("Referral"),
                  onPressed: () {},
                )),
              ],
            ),

            TextFieldContainer(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.money,
                      color: kprimarycolor,
                    ),
                    hintText: "Bill amount",
                    border: InputBorder.none),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                textAlign: TextAlign.center,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: "Coupon for click to here",
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.redeem,
                        size: 32,
                      ),
                      color: Colors.black,
                    ),
                    border: InputBorder.none),
              ),
            ),

            const TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                    enabled: false,
                    icon: Icon(
                      Icons.money,
                      color: kprimarycolor,
                    ),
                    hintText: "Total ammount",
                    border: InputBorder.none),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                    focusColor: kprimarycolor,
                    value: _chosenvalue,
                    items: <String>["Cash", "Card", "UPI", "Other"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text("Choose payment method "),
                    borderRadius: BorderRadius.circular(23),
                    onChanged: (String? value) {
                      setState(() {
                        _chosenvalue = value;
                      });
                    }),
              ],
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text(
                      "Send SMS ?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                            value: Bestsite.one,
                            groupValue: _site,
                            onChanged: (Bestsite? value) {
                              setState(() {
                                _site = value!;
                              });
                            }),
                        Text("Yes"),
                        Radio(
                            value: Bestsite.two,
                            groupValue: _site,
                            onChanged: (Bestsite? value) {
                              setState(() {
                                _site = value!;
                              });
                            }),
                        Text("No")
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Text(
                    "Reminder",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextFieldReminder(
                    child: TextField(
                      style: TextStyle(fontSize: 13),
                      controller: dateinput,
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
                              DateFormat("yyyy-MM-dd").format(pickeddate);
                          print(formatdate);
                          setState(() {
                            dateinput.text = formatdate;
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
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "/",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TextFieldDays(
                    child: TextField(
                      style: TextStyle(fontSize: 13),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "days", border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),

            //tomarrow
            SizedBox(height: 20),
            Container(
              width: size.width * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    color: kprimarycolor,
                    onPressed: () {},
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}

// Texfield Days Class
class TextFieldDays extends StatelessWidget {
  final Widget child;

  const TextFieldDays({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 9),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.2,
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
      width: size.width * 0.4,
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
