import 'package:diet_plan/services/eveningsnackadd.dart';
import 'package:diet_plan/views/DietHome.dart';
import 'package:diet_plan/views/add.dart';
import 'package:flutter/material.dart';

int? calorieeveningsnack = 0;
List<SearchTerms> eveningsnackList = [
  SearchTerms("orange", "eveningsnack", 25),
  SearchTerms("Apple", "eveningsnack", 28),
  SearchTerms("Banana", "eveningsnack", 45),
  SearchTerms("Mango", "eveningsnack", 48),
  SearchTerms("Pears", "eveningsnack", 89),
  SearchTerms("Watermelons", "eveningsnack", 68),
  SearchTerms("Blueberries", "eveningsnack", 78),
  SearchTerms("Pineapples", "eveningsnack", 52),
  SearchTerms("Strawberries", "eveningsnack", 75),
];
List<SearchTerms> calorieeveningsnackopted = [];

class eveningsnack extends StatefulWidget {
  final String name;
  final int cal;
  final bool selected;
  eveningsnack(
      {super.key,
      required this.name,
      required this.cal,
      required this.selected});

  @override
  State<eveningsnack> createState() => _eveningsnackState();
}

class _eveningsnackState extends State<eveningsnack> {
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
                    "${calorieeveningsnack} of " +
                        widget.cal.toString() +
                        " cal",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Future result = showSearch(
                            context: context,
                            delegate: eveningsnackadd(
                                searchTerms: eveningsnackList,
                                name: widget.name));
                        result.then((value) {
                          calorieeveningsnack = 0;
                          calorieeveningsnackopted = value;
                          for (var fruit in calorieeveningsnackopted) {
                            calorieeveningsnack =
                                calorieeveningsnack! + fruit.cal!;
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
              itemCount: eveningsnackList.length,
              itemBuilder: ((context, index) {
                if (eveningsnackList[index].isChecked == true &&
                    eveningsnackList[index].meal == "eveningsnack" &&
                    eveningsnackList != null) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: 200,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      eveningsnackList[index].name!,
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
