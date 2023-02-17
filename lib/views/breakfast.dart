import 'package:diet_plan/services/breakfastadd.dart';
import 'package:diet_plan/views/DietHome.dart';
import 'package:diet_plan/views/add.dart';
import 'package:flutter/material.dart';

int? caloriebreakfast = 0;
List<SearchTerms> breakfastList = [
  SearchTerms("orange", "breakfast", 25),
  SearchTerms("Apple", "breakfast", 28),
  SearchTerms("Banana", "breakfast", 45),
  SearchTerms("Mango", "breakfast", 48),
  SearchTerms("Pears", "breakfast", 89),
  SearchTerms("Watermelons", "breakfast", 68),
  SearchTerms("Blueberries", "breakfast", 78),
  SearchTerms("Pineapples", "breakfast", 52),
  SearchTerms("Strawberries", "breakfast", 75),
];
List<SearchTerms> caloriebreakfastopted = [];

class breakfast extends StatefulWidget {
  final String name;
  final int cal;
  final bool selected;
  breakfast(
      {super.key,
      required this.name,
      required this.cal,
      required this.selected});

  @override
  State<breakfast> createState() => _breakfastState();
}

class _breakfastState extends State<breakfast> {
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
                    "${caloriebreakfast} of " + widget.cal.toString() + " cal",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Future result = showSearch(
                            context: context,
                            delegate: breakfastadd(
                                searchTerms: breakfastList, name: widget.name));
                        result.then((value) {
                          caloriebreakfast = 0;
                          caloriebreakfastopted = value;
                          for (var fruit in caloriebreakfastopted) {
                            caloriebreakfast = caloriebreakfast! + fruit.cal!;
                          }
                          setState(() {});
                        });
                        print(result);
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
              itemCount: breakfastList.length,
              itemBuilder: ((context, index) {
                if (breakfastList[index].isChecked == true &&
                    breakfastList[index].meal == "breakfast" &&
                    breakfastList != null) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: 200,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      breakfastList[index].name!,
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
