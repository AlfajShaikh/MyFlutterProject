import 'package:company_project/constratanits.dart';
import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customersupport(),
    );
  }
}

class customersupport extends StatefulWidget {
  const customersupport({Key? key}) : super(key: key);

  @override
  _customersupportState createState() => _customersupportState();
}

class _customersupportState extends State<customersupport> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/support.png",
            height: size.height * 0.2,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Write your Query or Feedback",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          textFieldFeedback(
            child: TextFormField(
              minLines: 1,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.feedback_rounded,
                  color: kprimarycolor,
                ),
                hintText: "Write your Query / Feedback",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Alternatively call us at 07304110203 / 02066001158.\nOr mail us at mail@riseretail.net",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: size.width * 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: FlatButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: kprimarycolor,
                  onPressed: () {},
                  child: const Text(
                    "Submit ",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class textFieldFeedback extends StatelessWidget {
  final Widget child;
  const textFieldFeedback({
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
      height: size.height * 0.2,
      decoration: BoxDecoration(
          color: kprimarylightcolor, borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
