import 'package:flutter/material.dart';
import 'package:no_broker_demo/views/home_page.dart';
import 'package:no_broker_demo/views/search_page.dart';
import 'package:no_broker_demo/views/add_post_page.dart';
import 'package:no_broker_demo/views/chats_page.dart';
import 'package:no_broker_demo/views/profile_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentTab = 0;

  final List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const AddPostPage(),
    const ChatsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentTab],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFF7B49),
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            currentTab = 2;
          });
        },
        child: Icon(
          color: Colors.white,
          Icons.add,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Stack(
        children: <Widget>[
          Container(
            color: Color(0xfff1a587),
            height: 80,
          ),
          Positioned(
              right: 0,
              left: 0,
              top: 10,
              bottom: 0,
              child: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 4,
                child: SizedBox(
                  child: Row(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildNavigatingItem(
                            icon: Icons.home,
                            index: 0,
                            label: "Home",
                          ),
                          buildNavigatingItem(
                            icon: Icons.search,
                            index: 1,
                            label: "Search",
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildNavigatingItem(
                            icon: Icons.chat,
                            label: "Chats",
                            index: 3,
                          ),
                          buildNavigatingItem(
                            icon: Icons.person,
                            label: "Profile",
                            index: 4,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget buildNavigatingItem({
    required IconData icon,
    required int index,
    required String label,
  }) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          currentTab = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentTab == index ? Color(0xffFF7B49) : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: currentTab == index ? Color(0xffFF7B49) : Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
