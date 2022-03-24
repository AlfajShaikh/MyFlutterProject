import 'package:company_project/constratanits.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpanseData extends StatefulWidget {
  const ExpanseData({Key? key}) : super(key: key);

  @override
  _ExpanseDataState createState() => _ExpanseDataState();
}

class _ExpanseDataState extends State<ExpanseData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expansedata(),
    );
  }
}

class Expansedata extends StatefulWidget {
  const Expansedata({Key? key}) : super(key: key);

  @override
  _ExpansedataState createState() => _ExpansedataState();
}

class _ExpansedataState extends State<Expansedata> {
  TextEditingController dateinput = TextEditingController();
  String? _chosenvalue, _secondchosenvalue;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 220,
              ),
              Text(
                "Expanse Mangment",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              ExpanseTextField(
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.account_circle,
                        color: kprimarycolor,
                      ),
                      hintText: "Expanse name",
                      border: InputBorder.none),
                ),
              ),
              ExpanseTextField(
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.vpn_key_rounded,
                        color: kprimarycolor,
                      ),
                      hintText: "Vendor name",
                      border: InputBorder.none),
                ),
              ),
              ExpanseTextField(
                child: TextField(
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
                      hintText: "Date",
                      border: InputBorder.none),
                ),
              ),
              ExpanseTextField(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.money,
                        color: kprimarycolor,
                      ),
                      hintText: "Price",
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
                      hint: Text("Choose payment method   "),
                      borderRadius: BorderRadius.circular(23),
                      onChanged: (String? value) {
                        setState(() {
                          _chosenvalue = value;
                        });
                      }),
                ],
              ),
              Text(
                "&",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                      focusColor: kprimarycolor,
                      value: _secondchosenvalue,
                      items: <String>["Paid", "Dues"]
                          .map<DropdownMenuItem<String>>((String value1) {
                        return DropdownMenuItem<String>(
                          value: value1,
                          child: Text(value1),
                        );
                      }).toList(),
                      hint: Text("Choose categaries           "),
                      borderRadius: BorderRadius.circular(23),
                      onChanged: (String? value1) {
                        setState(() {
                          _secondchosenvalue = value1;
                        });
                      }),
                ],
              ),
              SizedBox(
                height: 30,
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ExpanseData();
                        }));
                      },
                      child: const Text(
                        "submit ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpanseTextField extends StatelessWidget {
  final Widget child;
  const ExpanseTextField({
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
