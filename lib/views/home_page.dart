import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_broker_demo/custom_widgets/land_info.dart';
import 'package:no_broker_demo/provider/home_provider.dart';
import 'package:no_broker_demo/shared/extension.dart';
import 'package:no_broker_demo/views/select_category_page.dart';
import 'package:no_broker_demo/custom_widgets/side_drawer.dart';

import '../core/model/land_details.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

bool gridView = false;

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(landProvider).loadLandDetails();
  }

  @override
  Widget build(BuildContext context) {
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

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final landReader = ref.watch(landProvider);
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
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: width * 0.01),
            height: height * 0.06,
            color: const Color(0xffFF5722),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // height: 45,
                  width: 80,
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
                Container(
                  // height: 45,
                  width: width * 0.6,
                  decoration: boxDecoration,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: const TextStyle(
                                    fontSize: 14, color: Colors.black26),
                                border: InputBorder.none),
                          ),
                        ),
                        Icon(Icons.search, size: 16, color: Color(0xffFF5722)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      ref.read(landProvider).loadLandDetails();
                    },
                    child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                            color: const Color(0xffFF5722),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.fromBorderSide(BorderSide(
                              color: Colors.white,
                            ))),
                        child: Icon(
                          Icons.refresh,
                          color: Colors.white,
                        )))
              ],
            ),
          ),
          SizedBox(
            height: height * 0.22,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 16.0,
                    left: 16.0,
                    top: height * 0.015,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.goto(
                            () => SelectCategoryPage(),
                          );
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: texts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                "assets/images/img.png",
                                scale: 6,
                              ),
                            ),
                            Text(texts[index])
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(""),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                gridView = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: !gridView
                                      ? Colors.white
                                      : const Color(0xffFF5722),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.fromBorderSide(BorderSide(
                                    color: !gridView
                                        ? Colors.grey.shade400
                                        : Colors.transparent,
                                  ))),
                              child: Icon(
                                Icons.grid_view_rounded,
                                size: 22,
                                color: !gridView ? Colors.grey : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                gridView = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: gridView
                                      ? Colors.white
                                      : const Color(0xffFF5722),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.fromBorderSide(BorderSide(
                                    color: gridView
                                        ? Colors.grey.shade400
                                        : Colors.transparent,
                                  ))),
                              child: Icon(
                                Icons.list,
                                size: 22,
                                color: !gridView ? Colors.white : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Top Projects",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      gridView
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 3 / 4.6,
                              ),
                              itemCount: landReader.value?.length ?? 0,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                final LandDetails details =
                                    landReader.value![index];
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.black12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(children: <Widget>[
                                        SizedBox(
                                          height: 160,
                                          width: double.infinity,
                                          child: Image.asset(
                                            "assets/images/img.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.deepPurple,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.fromBorderSide(
                                                    BorderSide(
                                                  color: Colors.transparent,
                                                ))),
                                            child: Icon(Icons.access_time,
                                                size: 18, color: Colors.white),
                                          ),
                                        )
                                      ]),
                                      SizedBox(
                                        height: height * 0.005,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: width * 0.2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: const Color(0xfff5d9ce),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 6),
                                                child: Center(
                                                  child: const Text(
                                                    "Land/Plot",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xffFF5722)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              details.landName ?? "No Name",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.location_on,
                                                    color: Colors.black54,
                                                    size: 16),
                                                const SizedBox(width: 4),
                                                Expanded(
                                                  child: Text(
                                                    details.location ?? "Null",
                                                    style: const TextStyle(
                                                        color: Colors.black54),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        thickness: .5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.diamond_outlined,
                                              size: 14,
                                              color: Color(0xffFF7B49),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  size: 14,
                                                  color: Color(0xffFF7B49),
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(details.owner.toString())
                                              ],
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.bed,
                                                  size: 14,
                                                  color: Color(0xffFF7B49),
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text("4")
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          : ListView.builder(
                              itemCount: landReader.value?.length ?? 0,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                final LandDetails details =
                                    landReader.value![index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                      padding: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.fromBorderSide(
                                              BorderSide(
                                                  color: Colors.black12))),
                                      height: height * 0.25,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: height * 0.15,
                                                child: Image.asset(
                                                  "assets/images/img.png",
                                                  // scale: 5,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        color: const Color(
                                                            0xfff5d9ce),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 8.0,
                                                                vertical: 6),
                                                        child: Center(
                                                          child: const Text(
                                                            "Land/Plot",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xffFF5722)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.005,
                                                    ),
                                                    Text(
                                                      details.landName != null
                                                          ? details.landName
                                                              .toString()
                                                          : "No Name",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.005,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.location_on,
                                                            color:
                                                                Colors.black54),
                                                        Text(
                                                          details.location !=
                                                                  null
                                                              ? details.location
                                                                  .toString()
                                                              : "Null",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.04,
                                                    ),
                                                    Text(
                                                      details.price != null
                                                          ? details.price
                                                              .toString()
                                                          : "Null",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xffFF5722)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.deepPurple,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        border: Border
                                                            .fromBorderSide(
                                                                BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                        ))),
                                                    child: Icon(
                                                        Icons.access_time,
                                                        size: 18,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.11,
                                                  ),
                                                  Text("")
                                                ],
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            thickness: 0.5,
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  DetailRow(
                                                    icon: Icons.person,
                                                    text: "I'm :",
                                                    value: details.owner != null
                                                        ? details.owner
                                                        : "Null",
                                                  ),
                                                  DetailRow(
                                                    icon: Icons.bed,
                                                    text: "Area Size :",
                                                    value:
                                                        details.areaSize != null
                                                            ? details.areaSize
                                                            : "Null",
                                                  ),
                                                  DetailRow(
                                                    icon: Icons.local_offer,
                                                    text: "Area Unit :",
                                                    value:
                                                        details.areaUnit != null
                                                            ? details.areaUnit
                                                            : "Null",
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  DetailRow(
                                                    icon: Icons.explore,
                                                    text: "Purpose :",
                                                    value:
                                                        details.purpose != null
                                                            ? details.purpose
                                                            : "Null",
                                                  ),
                                                  DetailRow(
                                                    icon: Icons.local_offer,
                                                    text: "Parking:",
                                                    value:
                                                        details.parking != null
                                                            ? details.parking
                                                            : "Null",
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  DetailRow(
                                                    icon: Icons.local_offer,
                                                    text: "location :",
                                                    value: details
                                                                .fullLocation !=
                                                            null
                                                        ? details.fullLocation
                                                        : "Null",
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                );
                              },
                            ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
