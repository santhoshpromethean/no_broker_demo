import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/img_5.png"),
                SizedBox(
                  height: height * 0.02,
                ),
                Text("YOUR ACCOUNT"),
                Divider(),
                Row(
                  children: [
                    Icon(Icons.shopping_basket_outlined),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text("How to sell fast"),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text("About Us"),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Icon(Icons.settings_outlined),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text("App Settings"),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text("LEGALS & SUPPORT"),
                Divider(),
                Row(
                  children: [
                    Icon(Icons.sticky_note_2_sharp),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text("Terms & Conditions"),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Icon(Icons.privacy_tip),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text("Privacy Policy"),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Icon(Icons.question_answer_outlined),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text("FAQ"),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Icon(Icons.contact_page),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text("Contact Us"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
