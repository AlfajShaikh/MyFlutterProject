import 'dart:io';
import 'package:company_project/constratanits.dart';
import 'package:company_project/loginscreen.dart';
import 'package:flutter/material.dart';
import "package:file_picker/file_picker.dart";
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  File? file;
  File? file2;
  @override
  Widget build(BuildContext context) {
    final filename = file != null ? basename(file!.path) : "No File";
    final filenamesecond = file2 != null ? basename(file2!.path) : "No File";
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/—Pngtree—documentation vector icon_3710737.png",
                height: size.height * 0.200,
              ),
              Text(
                "Document Varification",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Business Proof ",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "1. Shop act Or",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "2. GST Or",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "3. Any goverment apporved documents",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ))
                ],
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                width: size.width * 0.5,
                child: ClipRRect(
                  child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      color: Colors.black,
                      onPressed: () {
                        selctedFile();
                      },
                      child: const Text(
                        "Upload here",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                filename,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Individual Proof",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "1. Pan card OR",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "2. Aadhar card OR",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.left,
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "3. Driving Licence ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18),
                  ))
                ],
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                width: size.width * 0.5,
                child: ClipRRect(
                  child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      color: Colors.black,
                      onPressed: () {
                        selctedFilesecond();
                      },
                      child: const Text(
                        "Upload here",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                filenamesecond,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                width: size.width * 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      color: kprimarycolor,
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      child: const Text(
                        "Submit Documents",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future selctedFile() async {
    final result1 = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result1 == null) {
      return;
    }
    String path1 = result1.files.single.path!;
    setState(() => file = File(path1));
  }

  showAlertDialog(BuildContext context) {
    Widget okbutton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const loginscreen();
        }));
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Thankyou..!"),
      content: Text(
          "We will contact you within 24 hours.Please note customer care number is 7304110203"),
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

  Future selctedFilesecond() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      return;
    }
    String path = result.files.single.path!;
    setState(() => file2 = File(path));
  }
}
