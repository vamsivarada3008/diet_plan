import 'package:diet_plan/services/morningsnackadd.dart';
import 'package:diet_plan/views/DietHome.dart';
import 'package:diet_plan/views/add.dart';
import 'package:flutter/material.dart';

int? caloriemorningsnack = 0;
List<SearchTerms> morningsnackList = [
  SearchTerms("orange", "morningsnack", 25),
  SearchTerms("Apple", "morningsnack", 28),
  SearchTerms("Banana", "morningsnack", 45),
  SearchTerms("Mango", "morningsnack", 48),
  SearchTerms("Pears", "morningsnack", 89),
  SearchTerms("Watermelons", "morningsnack", 68),
  SearchTerms("Blueberries", "morningsnack", 78),
  SearchTerms("Pineapples", "morningsnack", 52),
  SearchTerms("Strawberries", "morningsnack", 75),
];
List<SearchTerms> caloriemorningsnackopted = [];

class morningsnack extends StatefulWidget {
  final String name;
  final int cal;
  final bool selected;
  morningsnack(
      {super.key,
      required this.name,
      required this.cal,
      required this.selected});

  @override
  State<morningsnack> createState() => _morningsnackState();
}

class _morningsnackState extends State<morningsnack> {
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
                    "${caloriemorningsnack} of " +
                        widget.cal.toString() +
                        " cal",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Future result = showSearch(
                            context: context,
                            delegate: morningsnackadd(
                                searchTerms: morningsnackList,
                                name: widget.name));
                        result.then((value) {
                          caloriemorningsnack = 0;
                          caloriemorningsnackopted = value;
                          for (var fruit in caloriemorningsnackopted) {
                            caloriemorningsnack =
                                caloriemorningsnack! + fruit.cal!;
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
              itemCount: morningsnackList.length,
              itemBuilder: ((context, index) {
                if (morningsnackList[index].isChecked == true &&
                    morningsnackList[index].meal == "morningsnack" &&
                    morningsnackList != null) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: 200,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      morningsnackList[index].name!,
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
