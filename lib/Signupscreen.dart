import 'package:company_project/Document.dart';
import 'package:company_project/PackagePage.dart';
import 'package:company_project/body.dart';
import 'package:company_project/constratanits.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: body(),
    );
  }
}

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

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
            SizedBox(height: size.height * 0.08),
            Text(
              "Register",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/kisspng-user-avatar-computer-icons-blog-user-avatar-5ac207ccb2e969.3756230715226654207328.png",
              height: size.height * 0.20,
            ),
            SizedBox(height: size.height * 0.03),
            const TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kprimarycolor,
                    ),
                    hintText: "Outlet name",
                    border: InputBorder.none),
              ),
            ),
            const TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.house,
                      color: kprimarycolor,
                    ),
                    hintText: "Address",
                    border: InputBorder.none),
              ),
            ),
            const TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.location_city,
                      color: kprimarycolor,
                    ),
                    hintText: "City ",
                    border: InputBorder.none),
              ),
            ),
            const TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.pin,
                      color: kprimarycolor,
                    ),
                    hintText: "Pin",
                    border: InputBorder.none),
              ),
            ),
            const TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.contact_phone,
                      color: kprimarycolor,
                    ),
                    hintText: "Contact Person",
                    border: InputBorder.none),
              ),
            ),
            const TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.merge_type_sharp,
                      color: kprimarycolor,
                    ),
                    hintText: "Types of Stores",
                    border: InputBorder.none),
              ),
            ),
            SizedBox(height: size.height * 0.02),
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
                        return const PackagePage();
                      }));
                    },
                    child: const Text(
                      "Register",
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
