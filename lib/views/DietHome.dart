import 'package:diet_plan/views/breakfast.dart';
import 'package:diet_plan/views/calorieTake.dart';
import 'package:diet_plan/views/dinner.dart';
import 'package:diet_plan/views/eveningsnack.dart';
import 'package:diet_plan/views/lunch.dart';
import 'package:diet_plan/views/morningsnack.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

dynamic calory = 0;

class SearchTerms {
  String? name;
  bool? isChecked;
  String? meal;
  int? cal;

  SearchTerms(this.name, this.meal, this.cal, {this.isChecked = false});
}

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

List<SearchTerms> opted = [];

class DietHome extends StatefulWidget {
  const DietHome({super.key});

  @override
  State<DietHome> createState() => _DietHomeState();
}

class _DietHomeState extends State<DietHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diet Plan"),
      ),
      body: SingleChildScrollView(
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
                    Text(
                      "Eat upto ${calory} cal",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
            breakfast(
                name: "breakfast", cal: (calory / 4).toInt(), selected: false),
            morningsnack(
                name: "morningsnack",
                cal: (calory / 8).toInt(),
                selected: false),
            lunch(name: "lunch", cal: (calory / 4).toInt(), selected: false),
            eveningsnack(
                name: "eveningsnack",
                cal: (calory / 8).toInt(),
                selected: false),
            dinner(name: "dinner", cal: (calory / 4).toInt(), selected: false),
          ],
        ),
      ),
    );
  }
}
