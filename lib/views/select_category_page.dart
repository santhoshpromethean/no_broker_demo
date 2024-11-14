import 'package:flutter/material.dart';

class SelectCategoryPage extends StatefulWidget {
  const SelectCategoryPage({super.key});

  @override
  State<SelectCategoryPage> createState() => _SelectCategoryPageState();
}

class _SelectCategoryPageState extends State<SelectCategoryPage> {
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
      appBar: AppBar(
        backgroundColor: const Color(0xffFF5722),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context), // Corrected back navigation
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Select Category",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "All Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
