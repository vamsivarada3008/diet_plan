import 'package:diet_plan/services/dinneradd.dart';
import 'package:diet_plan/views/DietHome.dart';
import 'package:diet_plan/views/add.dart';
import 'package:flutter/material.dart';

int? caloriedinner = 0;
List<SearchTerms> dinnerList = [
  SearchTerms("orange", "dinner", 25),
  SearchTerms("Apple", "dinner", 28),
  SearchTerms("Banana", "dinner", 45),
  SearchTerms("Mango", "dinner", 48),
  SearchTerms("Pears", "dinner", 89),
  SearchTerms("Watermelons", "dinner", 68),
  SearchTerms("Blueberries", "dinner", 78),
  SearchTerms("Pineapples", "dinner", 52),
  SearchTerms("Strawberries", "dinner", 75),
];
List<SearchTerms> caloriedinneropted = [];

class dinner extends StatefulWidget {
  final String name;
  final int cal;
  final bool selected;
  dinner(
      {super.key,
      required this.name,
      required this.cal,
      required this.selected});

  @override
  State<dinner> createState() => _dinnerState();
}

class _dinnerState extends State<dinner> {
  var result;

  @override
  Widget build(BuildContext context) {
    //refresh();
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 16,
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${caloriedinner} of " + widget.cal.toString() + " cal",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Future result = showSearch(
                            context: context,
                            delegate: dinneradd(
                                searchTerms: dinnerList, name: widget.name));
                        result.then((value) {
                          caloriedinner = 0;
                          caloriedinneropted = value;
                          for (var fruit in caloriedinneropted) {
                            caloriedinner = caloriedinner! + fruit.cal!;
                          }
                          setState(() {});
                        });
                      },
                      icon: const Icon(
                        IconData(0xf52d, fontFamily: 'MaterialIcons'),
                        color: Colors.orange,
                        size: 30,
                      ))
                ],
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 238, 236, 236),
          ),
          child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: dinnerList.length,
              itemBuilder: ((context, index) {
                if (dinnerList[index].isChecked == true &&
                    dinnerList[index].meal == "dinner" &&
                    dinnerList != null) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: 200,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      dinnerList[index].name!,
                      style: TextStyle(fontSize: 20),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }
                return SizedBox(
                  width: 2,
                  height: MediaQuery.of(context).size.height,
                );
              })),
        )
      ],
    );
  }
}
