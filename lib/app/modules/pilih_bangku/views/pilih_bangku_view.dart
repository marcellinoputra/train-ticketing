import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pilih_bangku_controller.dart';

class PilihBangkuView extends GetView<PilihBangkuController> {
  const PilihBangkuView({Key? key}) : super(key: key);

  final purpleColor = 0xFF6556CEE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/bg.png'))),
          ),
          Column(
            children: [
              SizedBox(height: context.mediaQueryPadding.top),
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Select Your\nSeat",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF333E63)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Commuter Line (A)"),
                        Text("Wagon A1",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(purpleColor),
                                fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemStatus(
                      status: "Available",
                      color: Colors.white,
                    ),
                    ItemStatus(
                      status: "Filled",
                      color: Color(0xFFFF8B2D),
                    ),
                    ItemStatus(
                      status: "Selected",
                      color: Color(purpleColor),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wagon",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "A",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "B",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "C",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "D",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "E",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(children: [
                        Container(
                          width: 60,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: List.generate(
                                controller.gerbong.length,
                                (index) => Container(
                                  height: 150,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(purpleColor),
                                  ),
                                  child: Center(child: Text("${index + 1}")),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Container(
                                child: GridView.count(
                                    padding: EdgeInsets.all(10),
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 5,
                                    // children: List.generate(
                                    //     75,
                                    //     (index) => Container(
                                    //           width: 50,
                                    //           height: 50,
                                    //           decoration: BoxDecoration(
                                    //               color: Colors.white,
                                    //               border: Border.all(
                                    //                   color: Colors.black54),
                                    //               borderRadius:
                                    //                   BorderRadius.circular(10)),
                                    //         ))),
                                    children: controller
                                        .gerbong[controller.indexGerbong.value]
                                        .map((data) => Container(
                                              width: 50,
                                              height: 50,
                                              child: Text(data["status"]),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black38),
                                                  color: data["status"] == '1'
                                                      ? Colors.blue
                                                      : Colors.orange,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ))
                                        .toList())))
                      ]),
                    ),
                  )
                ]),
              )),
              Container(
                height: 100,
                child: Center(
                    child: ElevatedButton(
                  onPressed: () => {},
                  child: Text(
                    "Select Your Seat",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF6556CEE),
                      fixedSize: Size(Get.width * 0.6, 50)),
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ItemStatus extends StatelessWidget {
  const ItemStatus({
    super.key,
    required this.status,
    required this.color,
  });

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          status,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
