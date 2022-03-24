import 'dart:ui';

import 'package:company_project/background.dart';
import 'package:company_project/constratanits.dart';
import 'package:company_project/loginscreen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.300),
            Image.asset(
              "assets/PngItem_5001688.png",
              height: size.height * 0.200,
              alignment: Alignment.center,
              width: 400,
            ),
            SizedBox(height: size.height * 0.05),
            const Text(
              "Welcome User",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 25,
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
                        return const loginscreen();
                      }));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
