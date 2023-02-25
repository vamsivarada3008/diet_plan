import 'package:diet_plan/services/lunchadd.dart';
import 'package:diet_plan/views/DietHome.dart';
import 'package:diet_plan/views/add.dart';
import 'package:flutter/material.dart';

int? calorielunch = 0;
List<SearchTerms> lunchList = [
  SearchTerms("orange", "lunch", 25),
  SearchTerms("Apple", "lunch", 28),
  SearchTerms("Banana", "lunch", 45),
  SearchTerms("Mango", "lunch", 48),
  SearchTerms("Pears", "lunch", 89),
  SearchTerms("Watermelons", "lunch", 68),
  SearchTerms("Blueberries", "lunch", 78),
  SearchTerms("Pineapples", "lunch", 52),
  SearchTerms("Strawberries", "lunch", 75),
];
List<SearchTerms> calorielunchopted = [];

class lunch extends StatefulWidget {
  final String name;
  final int cal;
  final bool selected;
  lunch(
      {super.key,
      required this.name,
      required this.cal,
      required this.selected});

  @override
  State<lunch> createState() => _lunchState();
}

class _lunchState extends State<lunch> {
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
                    "${calorielunch} of " + widget.cal.toString() + " cal",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Future result = showSearch(
                            context: context,
                            delegate: lunchadd(
                                searchTerms: lunchList, name: widget.name));
                        result.then((value) {
                          calorielunch = 0;
                          calorielunchopted = value;
                          for (var fruit in calorielunchopted) {
                            calorielunch = calorielunch! + fruit.cal!;
                          }
                          setState(() {});
                        });
                      },
                      icon: const Icon(
                        IconData(0xf52d, fontFamily: 'MaterialIcons'),
                        color: Colors.pink,
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
              itemCount: lunchList.length,
              itemBuilder: ((context, index) {
                if (lunchList[index].isChecked == true &&
                    lunchList[index].meal == "lunch" &&
                    lunchList != null) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: 200,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      lunchList[index].name!,
                      style: TextStyle(fontSize: 20),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.pink,
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
