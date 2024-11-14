import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_broker_demo/views/home_page.dart';
import 'package:no_broker_demo/views/search_page.dart';
import 'package:no_broker_demo/views/add_post_page.dart';
import 'package:no_broker_demo/views/chats_page.dart';
import 'package:no_broker_demo/views/profile_page.dart';

class CustomBottomNavigationBar extends ConsumerStatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  ConsumerState<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends ConsumerState<CustomBottomNavigationBar> {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: pageList[currentTab],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFF5722),
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            currentTab = 2;
          });
        },
        child: const Icon(
          color: Colors.white,
          Icons.add,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Stack(
        children: <Widget>[
          Container(
            color: Color(0xffefbda9),
            height: height * 0.1,
          ),
          Positioned(
              right: 0,
              left: 0,
              top: height * 0.011,
              bottom: 0,
              child: BottomAppBar(
                // height: 50,
                shape: const CircularNotchedRectangle(),
                // notchMargin: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildNavigatingItem(
                      icon: Icons.home,
                      index: 0,
                      text: "Home",
                    ),
                    buildNavigatingItem(
                      icon: Icons.search,
                      index: 1,
                      text: "Search",
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: Text(
                        "Post",
                        style: TextStyle(
                          color: currentTab == 2
                              ? Color(0xffFF5722)
                              : Colors.black54,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    buildNavigatingItem(
                      icon: Icons.chat,
                      text: "Chats",
                      index: 3,
                    ),
                    buildNavigatingItem(
                      icon: Icons.person,
                      text: "Profile",
                      index: 4,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget buildNavigatingItem({
    required IconData icon,
    required int index,
    required String text,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentTab = index;
        });
      },
      child: Column(
        children: [
          Icon(
            size: 20,
            icon,
            color: currentTab == index ? Color(0xffFF5722) : Colors.black54,
          ),
          Text(
            text,
            style: TextStyle(
              color: currentTab == index ? Color(0xffFF5722) : Colors.black54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
