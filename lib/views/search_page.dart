import 'package:flutter/material.dart';

import '../custom_widgets/land_info.dart';
import '../custom_widgets/side_drawer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SearchPage> {
  List<String> texts = [
    'Apartments',
    'Commercial',
    'Farm',
    'Godown',
    'Hotel/Resorts',
    'House',
    'Industrial',
    'Land/Plot',
    'Office',
    'Shop',
    'Villa',
  ];
  List<String> texts1 = [
    '25 Listings',
    '2378 Listings',
    '723 Listings',
    '7472 Listings',
    '6574 Listings',
    '922 Listings',
    '2637 Listings',
    '4647 Listings',
    '28 Listings',
    '278 Listings',
    '473 Listings',
  ];

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
          Container(
            height: height * 0.06,
            color: const Color(0xffFF5722),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: width * 0.01),
              child: Container(
                // height: 45,
                width: width,
                decoration: boxDecoration,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_pin,
                          size: 16, color: Color(0xffFF5722)),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              hintText: "location",
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: Colors.black26),
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16),
                child: const Text(
                  "All Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1 / 1.2,
                ),
                itemCount: texts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xfff5d9ce),
                    ),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipOval(
                            child: Container(
                              width: width * 0.15,
                              height: width * 0.15,
                              color: const Color(0xffefbda9),
                              child: Image.asset(
                                "assets/images/img.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // SizedBox(height: height * 0.005),
                          Text(
                            texts[index],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          // SizedBox(height: height * 0.005),
                          Text(
                            texts1[index],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
