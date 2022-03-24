import 'package:company_project/Document.dart';
import 'package:company_project/constratanits.dart';
import 'package:company_project/loginscreen.dart';
import 'package:flutter/material.dart';

class PackagePage extends StatelessWidget {
  const PackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.04),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                          TextSpan(
                              text: "Packages Valid for\n12 Months",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ])),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 185,
                      width: 370,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 221,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(29),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 33,
                                      color: Color(0xFFD3D3D3).withOpacity(.84))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 35, horizontal: 21),
                            child: Text(
                              "Aspirant package",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                              top: 80,
                              child: Container(
                                height: 140,
                                width: 370,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: RichText(
                                          text: const TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              children: [
                                            TextSpan(
                                              text: "Charges Nill\n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue,
                                                  fontSize: 20),
                                            ),
                                            TextSpan(
                                                text: "Charges Nill SMS @20 ps",
                                                style: TextStyle(
                                                    color: Colors.black))
                                          ])),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 101,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 30),
                                          alignment: Alignment.center,
                                          child: GestureDetector(
                                              onTap: () {
                                                showAlertDialogAspirant(
                                                    context);
                                              },
                                              child: const Text(
                                                "Details",
                                                style: TextStyle(
                                                    color: Colors.lightBlue),
                                              )),
                                        ),
                                        Expanded(
                                            child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return MainPage();
                                            }));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: const BoxDecoration(
                                                color: kprimarycolor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(29))),
                                            child: const Text(
                                              "Select",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 185,
                      width: 370,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 221,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(29),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 33,
                                      color: Color(0xFFD3D3D3).withOpacity(.84))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 35, horizontal: 21),
                            child: Text(
                              "Climbers package",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                              top: 80,
                              child: Container(
                                height: 100,
                                width: 370,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: RichText(
                                          text: const TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              children: [
                                            TextSpan(
                                              text: "Charges 2200/-\n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.blue),
                                            ),
                                            TextSpan(
                                                text: "SMS @15 paisa",
                                                style: TextStyle(
                                                    color: Colors.black))
                                          ])),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 101,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15),
                                          alignment: Alignment.center,
                                          child: GestureDetector(
                                              onTap: () {
                                                showAlertDialogClimber(context);
                                              },
                                              child: const Text(
                                                "Details",
                                                style: TextStyle(
                                                    color: Colors.lightBlue),
                                              )),
                                        ),
                                        Expanded(
                                            child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return MainPage();
                                            }));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: const BoxDecoration(
                                                color: kprimarycolor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(29),
                                                    bottomRight:
                                                        Radius.circular(29))),
                                            child: const Text(
                                              "Select",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      height: 185,
                      width: 370,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 221,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(29),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 33,
                                      color: Color(0xFFD3D3D3).withOpacity(.84))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 35, horizontal: 21),
                            child: Text(
                              "Professional package",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                              top: 80,
                              child: Container(
                                height: 125,
                                width: 370,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 24),
                                      child: RichText(
                                          text: const TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black),
                                              children: [
                                            TextSpan(
                                              text: "Charges 4500/-\n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.blue),
                                            ),
                                            TextSpan(
                                                text:
                                                    "one time 4500 SMS Free Additional SMS @15 paisa",
                                                style: TextStyle(
                                                    color: Colors.black))
                                          ])),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 101,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 30),
                                          alignment: Alignment.center,
                                          child: GestureDetector(
                                              onTap: () {
                                                showAlertDialog(context);
                                              },
                                              child: Text(
                                                "Details",
                                                style: TextStyle(
                                                    color: Colors.lightBlue),
                                              )),
                                        ),
                                        Expanded(
                                            child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return MainPage();
                                            }));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            decoration: const BoxDecoration(
                                                color: kprimarycolor,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(29),
                                                    bottomRight:
                                                        Radius.circular(29))),
                                            child: const Text(
                                              "Select",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ))
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

// Professional Alert Box
  showAlertDialog(BuildContext context) {
    Widget okbutton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Professional Pack"),
      content:
          Text("Charges 4500/- (One time 4500 SMS free)+ add SMS at 15 Paisa "),
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

// Aspirant Alert Box
  showAlertDialogAspirant(BuildContext context) {
    Widget okbutton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Aspirant Pack"),
      content: Text("Charges Nill+ Charges for SMS @20 paisa (if Required)"),
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

  //Climber Alert Box

  void showAlertDialogClimber(BuildContext context) {
    Widget okbutton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Climbers Pack"),
      content: Text("Charges 2200/- +SMS Charges @15 paisa "),
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
}
