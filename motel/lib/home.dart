import 'package:flutter/material.dart';

class Room {
  String? title;
  String? name;
  double width = 0;
  double height = 0;
  double money = 0;
  Room(this.title, this.name, this.width, this.height, this.money);
}

class Home extends StatelessWidget {
  Home({super.key});

  static List<Room> flowA = <Room>[
    Room("day A", "A1", 10, 20, 600.000),
    Room("day A", "A2", 10, 20, 600.000),
    Room("day A", "A3", 10, 20, 600.000),
    Room("day A", "A4", 10, 20, 600.000),
    Room("day A", "A5", 10, 20, 600.000),
    Room("day A", "A6", 10, 20, 600.000),
    Room("day A", "A7", 10, 20, 600.000),
    Room("day A", "A8", 10, 20, 600.000),
    Room("day A", "A9", 10, 20, 600.000),
    Room("day A", "A10", 10, 20, 600.000)
  ];

  static List<Room> flowB = <Room>[
    Room("day B", "B1", 10, 20, 600.000),
    Room("day B", "B2", 10, 20, 600.000),
    Room("day B", "B3", 10, 20, 600.000),
    Room("day B", "B4", 10, 20, 600.000),
    Room("day B", "B5", 10, 20, 600.000),
    Room("day B", "B6", 10, 20, 600.000),
    Room("day B", "B7", 10, 20, 600.000),
    Room("day B", "B8", 10, 20, 600.000),
    Room("day B", "B9", 10, 20, 600.000),
    Room("day B", "B10", 10, 20, 600.000)
  ];

  static List<Room> flowC = <Room>[
    Room("day C", "C1", 10, 20, 600.000),
    Room("day C", "C2", 10, 20, 600.000),
    Room("day C", "C3", 10, 20, 600.000),
    Room("day C", "C4", 10, 20, 600.000),
    Room("day C", "C5", 10, 20, 600.000),
    Room("day C", "C6", 10, 20, 600.000),
    Room("day C", "C7", 10, 20, 600.000),
    Room("day C", "C8", 10, 20, 600.000),
    Room("day C", "C9", 10, 20, 600.000),
    Room("day C", "C10", 10, 20, 600.000)
  ];

  List<List<Room>> flows = <List<Room>>[flowA, flowB, flowC];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
            itemCount: flows.length,
            itemBuilder: (BuildContext context1, int index1) {
              String title1 = flows[index1][0].title.toString();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Day $title1',
                    style: const TextStyle(backgroundColor: Colors.yellow),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemCount: flows[index1].length,
                      itemBuilder: (_, int index2) {
                        String name = flows[index1][index2].name.toString();
                        return Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Phòng\n$name',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow,
                                        backgroundColor: Colors.purple),
                                  ),
                                  const Text(
                                    "Dài x Rộng: 10m x 20m",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow,
                                        backgroundColor: Colors.purpleAccent),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.yellow,
                                        child: const Icon(
                                          Icons.attach_money,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ),
                                      const Text(
                                        "600.00",
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow,
                                            backgroundColor:
                                                Colors.purpleAccent),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
