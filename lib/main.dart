import 'package:company_project/BrandBuilderPage.dart';
import 'package:company_project/BusinessInsight.dart';
import 'package:company_project/Customercarepage.dart';
import 'package:company_project/Document.dart';
import 'package:company_project/ExpanseManagment.dart';
import 'package:company_project/LoginScreenBody.dart';
import 'package:company_project/LoyalityPage.dart';
import 'package:company_project/ModulePage.dart';
import 'package:company_project/PackagePage.dart';
import 'package:company_project/RdioGroupWidget.dart';
import 'package:company_project/Signupscreen.dart';
import 'package:company_project/Welcomepage.dart';
import 'package:company_project/constratanits.dart';

import 'package:company_project/loginscreen.dart';
import 'package:company_project/tablerowcheckrow.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kprimarycolor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: WelcomepageScreen());
  }
}
