import 'package:diet_plan/views/add.dart';
import 'package:diet_plan/views/calorieTake.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<SearchTerms> searchTermo = [
  SearchTerms("a", "breakfast", 25),
  SearchTerms("Apple", "Lunch", 28),
  SearchTerms("Banana", "Morning Snack", 45),
  SearchTerms("Mango", "Evening Snack", 48),
  SearchTerms("Pears", "breakfast", 89),
  SearchTerms("Watermelons", "Dinner", 68),
  SearchTerms("Blueberries", "Evening Snack", 78),
  SearchTerms("Pineapples", "breakfast", 52),
  SearchTerms("Strawberries", "Morning Snack", 75),
];

class MyList with ChangeNotifier {
  List<SearchTerms> items = searchTermo;
  void onChange() {
    notifyListeners();
  }
}

List<SearchTerms> opted = [];

class DietHome extends StatefulWidget {
  const DietHome({super.key});

  @override
  State<DietHome> createState() => _DietHomeState();
}

class _DietHomeState extends State<DietHome> {
  Future refresh() async {
    searchTermo;
    for (var fruit in searchTermo) {
      if (fruit.isChecked == true) {
        opted.add(fruit);
      } else {
        opted.remove(fruit);
      }
    }
    //print("Reached here!");
    setState(() {
      opted = [];
      for (var fruit in searchTermo) {
        if (fruit.isChecked == true) {
          opted.add(fruit);
        }
      }
      setState(() {});
      print("Reached here!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diet Plan"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          refresh();
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          settings: RouteSettings(name: "/Page1"),
                          builder: ((context) => CalorieTake())));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        IconData(0xe532, fontFamily: 'MaterialIcons'),
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Eat upto 2350 Cal",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      const Icon(
                        IconData(0xf558, fontFamily: 'MaterialIcons'),
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const display(name: "breakfast", cal: 512, selected: false),
              const display(
                name: "Morning Snack",
                cal: 512,
                selected: false,
              ),
              const display(
                name: "Lunch",
                cal: 512,
                selected: false,
              ),
              const display(
                name: "Evening Snack",
                cal: 512,
                selected: false,
              ),
              const display(
                name: "Dinner",
                cal: 512,
                selected: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class display extends StatefulWidget {
  final String name;
  final int cal;
  final bool selected;
  const display(
      {super.key,
      required this.name,
      required this.cal,
      required this.selected});

  @override
  State<display> createState() => _displayState();
}

class _displayState extends State<display> {
  var result;
  void handle() {
    setState(() {});
  }

  int? calorie = 0;
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
                    "${calorie} of " + widget.cal.toString() + " cal",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        Future result = showSearch(
                            context: context,
                            delegate: Mydelegate(
                                searchTerms: searchTermo, name: widget.name));
                        result.then((value) {
                          opted = value;
                          calorie = 0;
                          for (var fruit in opted) {
                            if (fruit.meal == "breakfast") {
                              calorie = calorie! + fruit.cal!;
                            }
                          }
                          setState(() {
                            searchTermo;
                          });
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
        (!widget.selected)
            ? Container(
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
                    itemCount: opted.length,
                    itemBuilder: ((context, index) {
                      if (opted[index].isChecked == true &&
                          opted[index].meal == "breakfast" &&
                          opted != null) {
                        print("this happens ${opted[index]}");
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          width: 200,
                          padding: EdgeInsets.all(20),
                          child: Text(
                            opted[index].name!,
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
            : Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Colors.green,
              )
      ],
    );
  }
}
