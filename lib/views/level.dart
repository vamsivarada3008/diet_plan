import 'package:diet_plan/views/DietHome.dart';
import 'package:diet_plan/views/breakfast.dart';
import 'package:diet_plan/views/calorieTake.dart';
import 'package:diet_plan/views/dinner.dart';
import 'package:diet_plan/views/eveningsnack.dart';
import 'package:diet_plan/views/lunch.dart';
import 'package:diet_plan/views/morningsnack.dart';
import 'package:flutter/material.dart';

// Define a list of options for the radio button

// Define a variable to keep track of the selected option
String? selectedLevel = "level_1";

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => LevelPageState();
}

class LevelPageState extends State<LevelPage> {
  set(String level) {
    setState(() {
      selectedLevel = level;
      print(selectedLevel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calorie Intake"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "How active are you?",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              child: Text(
                "Based on your lifestyle, we can assess your daily calorie requirements.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () {
                  //receive();
                  set("level_1");
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color:
                        selectedLevel == "level_1" ? Colors.pink : Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(187, 186, 186, 0.094),
                        offset: Offset(0, 0),
                        blurRadius: 23,
                        spreadRadius: 13,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(170, 169, 169, 0.094),
                        offset: Offset(5, 16),
                        blurRadius: 24,
                        spreadRadius: -3,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.pink,
                        ),
                        child: Icon(
                          IconData(0xf54a, fontFamily: 'MaterialIcons'),
                          size: 30,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 3 / 4,
                        child: Column(
                          children: [
                            Text(
                              "Little or No Activity",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Mostly sitting through the day (eg. Desk Job,",
                              textAlign: TextAlign.center,
                            ),
                            Text("Bank Teller)"),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  // receive();
                  set("level_2");
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color:
                        selectedLevel == "level_2" ? Colors.pink : Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(187, 186, 186, 0.094),
                        offset: Offset(0, 0),
                        blurRadius: 23,
                        spreadRadius: 13,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(170, 169, 169, 0.094),
                        offset: Offset(5, 16),
                        blurRadius: 24,
                        spreadRadius: -3,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.pink,
                        ),
                        child: Icon(
                          IconData(0xf51b, fontFamily: 'MaterialIcons'),
                          size: 30,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 3 / 4,
                        child: Column(
                          children: [
                            Text(
                              "Lightly Active",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Mostly standing through the day(eg. Sales",
                              textAlign: TextAlign.center,
                            ),
                            Text("Associate, Teacher)"),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  // receive();
                  set("level_3");
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color:
                        selectedLevel == "level_3" ? Colors.pink : Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(187, 186, 186, 0.094),
                        offset: Offset(0, 0),
                        blurRadius: 23,
                        spreadRadius: 13,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(170, 169, 169, 0.094),
                        offset: Offset(5, 16),
                        blurRadius: 24,
                        spreadRadius: -3,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.pink,
                        ),
                        child: Icon(
                          IconData(0xe549, fontFamily: 'MaterialIcons'),
                          size: 30,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 3 / 4,
                        child: Column(
                          children: [
                            Text(
                              "Moderately Active",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Mostly walking or doing physical activities",
                              textAlign: TextAlign.center,
                            ),
                            Text("through the day(eg. Tour Guide, Waiter)"),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  //receive();
                  set("level_4");
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color:
                        selectedLevel == "level_4" ? Colors.pink : Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(187, 186, 186, 0.094),
                        offset: Offset(0, 0),
                        blurRadius: 23,
                        spreadRadius: 13,
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(170, 169, 169, 0.094),
                        offset: Offset(5, 16),
                        blurRadius: 24,
                        spreadRadius: -3,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.pink,
                        ),
                        child: Icon(
                          IconData(0xf0df, fontFamily: 'MaterialIcons'),
                          size: 30,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 3 / 4,
                        child: Column(
                          children: [
                            Text(
                              "Very Active",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Mostly doing heavy physical activities through",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                                "the day (eg. Gym Instructor,Construction Worker)"),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            receive(
                age: age!,
                gender: gender!,
                height: height!,
                weight: weight!,
                level: selectedLevel!);
            calory = (weightGoalsMap[weightvalue]?["calory"]).toInt();
            // for (var fruit in breakfastList) {
            //   if (fruit.isChecked == true) {
            //     caloriebreakfast = caloriebreakfast! + fruit.cal!;
            //   }
            // }
            // for (var fruit in morningsnackList) {
            //   if (fruit.isChecked == true) {
            //     caloriemorningsnack = caloriemorningsnack! + fruit.cal!;
            //   }
            // }
            // for (var fruit in dinnerList) {
            //   if (fruit.isChecked == true) {
            //     caloriedinner = caloriedinner! + fruit.cal!;
            //   }
            // }
            // for (var fruit in lunchList) {
            //   if (fruit.isChecked == true) {
            //     calorielunch = calorielunch! + fruit.cal!;
            //   }
            // }
            // for (var fruit in eveningsnackList) {
            //   if (fruit.isChecked == true) {
            //     calorieeveningsnack = calorieeveningsnack! + fruit.cal!;
            //   }
            // }

            setState(() {});
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => DietHome()),
              (Route<dynamic> route) => false,
            );
          },
          child: Icon(Icons.arrow_forward),
        ));
  }
}
