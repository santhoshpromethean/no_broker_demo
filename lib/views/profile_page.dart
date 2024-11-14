import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/images/img_2.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Image.asset(
            "assets/images/img_3.png",
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const Text(
            'Login for Better Experience',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
          SizedBox(
            height: height * 0.02,
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              "Privacy policy",
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }
}
