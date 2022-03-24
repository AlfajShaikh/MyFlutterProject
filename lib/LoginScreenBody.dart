import 'package:company_project/Loginbackground.dart';
import 'package:company_project/ModulePage.dart';
import 'package:company_project/Signupscreen.dart';
import 'package:company_project/constratanits.dart';
import 'package:flutter/material.dart';

class loginbody extends StatelessWidget {
  const loginbody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loginbackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: size.height * 0.01),
            Image.asset(
              "assets/kisspng-computer-icons-user-profile-person-5abd8530d0a352.2050393115223698408546.png",
              height: size.height * 0.2,
            ),
            SizedBox(height: size.height * 0.01),
            const TextFieldContainer(
              child: TextField(
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kprimarycolor,
                    ),
                    hintText: "Enter ID",
                    border: InputBorder.none),
              ),
            ),
            const TextFieldContainer(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: kprimarycolor,
                    ),
                    hintText: "Enter Password",
                    border: InputBorder.none),
              ),
            ),
            SizedBox(height: size.height * 0.03),
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
                        return const HomePage();
                      }));
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an Register?",
                  style: TextStyle(color: kprimarycolor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignUpScreen();
                    }));
                  },
                  child: Text(
                    " Register",
                    style: TextStyle(
                      color: kprimarycolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
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
      margin: EdgeInsets.symmetric(vertical: 9),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: kprimarylightcolor, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
