import 'package:flutter/material.dart';

import '../custom_widgets/side_drawer.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xffFF5722),
        centerTitle: true,
        flexibleSpace: Center(
          child: Padding(
            padding: EdgeInsets.only(top: height * .036),
            child: Image.asset(
              "assets/images/img_1.png",
              scale: 2.5,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Image.asset(
            "assets/images/img_4.png",
            scale: .8,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Center(
            child: const Text(
              textAlign: TextAlign.center,
              "Currently you're not logged in\nPlease log in or sign up to get your chat data",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Container(
                height: 40,
                width: width,
                decoration: BoxDecoration(
                  color: const Color(0xffFF5722),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(3),
                child: Center(
                  child: Text(
                    "Login/ SignUp",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontFamily: "Nunito",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
