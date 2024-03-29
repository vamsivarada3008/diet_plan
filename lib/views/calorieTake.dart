import 'package:diet_plan/views/level.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String? age,
    gender,
    activitylevel,
    height,
    weight,
    setlevel = "loss weight",
    setkg = "0.25 kg",
    weightvalue;
valueConvert(String setlevel, String setkg) {
  if (setlevel == "loss weight" && setkg == "0.25 kg") {
    weightvalue = "Mild weight loss";
  }
  if (setlevel == "loss weight" && setkg == "0.5 kg") {
    weightvalue = "Weight loss";
  }
  if (setlevel == "loss weight" && setkg == "1 kg") {
    weightvalue = "Extreme weight loss";
  }
  if (setlevel == "gain weight" && setkg == "0.25 kg") {
    weightvalue = "Mild weight gain";
  }
  if (setlevel == "gain weight" && setkg == "0.5 kg") {
    weightvalue = "Weight gain";
  }
  if (setlevel == "gain weight" && setkg == "1 kg") {
    weightvalue = "Extreme weight gain";
  }
}

Map<String, Map<String, dynamic>> weightGoalsMap = {};
calorieInTake(String json) {
  final decoded = jsonDecode(json);

  final goalsMap = Map<String, dynamic>.from(decoded['data']['goals']);
  //final Map<String, Map<String, dynamic>> weightGoalsMap = {};
  for (var key in goalsMap.keys) {
    if (key != "maintain weight") {
      weightGoalsMap[key] = Map<String, dynamic>.from(goalsMap[key]);
    }
  }

  //print("Here is your response: ${weightGoalsMap}");
}

class CalorieTake extends StatefulWidget {
  const CalorieTake({super.key});

  @override
  State<CalorieTake> createState() => _CalorieTakeState();
}

Future receive(
    {String level = "level_1",
    required String age,
    required String gender,
    required String height,
    required String weight}) async {
  var queryParameters = {
    'age': age,
    'gender': gender,
    'height': height,
    'weight': weight,
    'activitylevel': level
  };

  var url = 'https://fitness-calculator.p.rapidapi.com/dailycalorie';
  url +=
      '?' + queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&');
  final uri = Uri.parse(url);

  final response = await http.get(uri, headers: {
    'X-RapidAPI-Key': '696f86146amsh575084b1afaf2a4p12f3bbjsn7282259adf8f',
    'X-RapidAPI-Host': 'fitness-calculator.p.rapidapi.com'
  });

  if (response.statusCode == 200) {
    // print("response is here: ${response.body}");

    calorieInTake(response.body);
  } else {
    print("Error: ${response.statusCode}");
  }
}

class _CalorieTakeState extends State<CalorieTake> {
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void dispose() {
    ageController.dispose();
    heightController.dispose();
    genderController.dispose();
    weightController.dispose();
    super.dispose();
  }

  level(String level) {
    setState(() {
      setlevel = level;
    });
  }

  kg(String kg) {
    setState(() {
      setkg = kg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calorie Intake"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 3 / 4,
                          child: TextField(
                            controller: ageController,
                            decoration: InputDecoration(
                              labelText: "Age in years",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              age = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 3 / 4,
                          child: TextField(
                            controller: genderController,
                            decoration: InputDecoration(
                              labelText: "Enter you gender male/female",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              gender = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 3 / 4,
                          child: TextField(
                            controller: heightController,
                            decoration: InputDecoration(
                              labelText: "height in cms",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              height = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 3 / 4,
                          child: TextField(
                            controller: weightController,
                            decoration: InputDecoration(
                              labelText: "weight in kgs",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              weight = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                level("loss weight");
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Loss weight",
                                  style: TextStyle(fontSize: 20),
                                ),
                                decoration: BoxDecoration(
                                  color: setlevel == "loss weight"
                                      ? Colors.pink
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                level("gain weight");
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Gain weight",
                                  style: TextStyle(fontSize: 20),
                                ),
                                decoration: BoxDecoration(
                                  color: setlevel == "gain weight"
                                      ? Colors.pink
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                kg("0.25 kg");
                              },
                              child: Container(
                                width: 100,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "0.25 Kg",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                decoration: BoxDecoration(
                                  color: setkg == "0.25 kg"
                                      ? Colors.pink
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                kg("0.5 kg");
                              },
                              child: Container(
                                width: 100,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "0.5 Kg",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                decoration: BoxDecoration(
                                  color: setkg == "0.5 kg"
                                      ? Colors.pink
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                kg("1 kg");
                              },
                              child: Container(
                                width: 100,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "1 Kg",
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                decoration: BoxDecoration(
                                  color: setkg == "1 kg"
                                      ? Colors.pink
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("set level");
            print(setlevel);
            print("setkg");
            print(setkg);

            valueConvert(setlevel!, setkg!);
            print("weight value");
            print(weightvalue);
            receive(
                age: age!,
                gender: gender!,
                height: height!,
                weight: weight!,
                level: "level_4");

            print(weightGoalsMap[weightvalue]);

            print(weightGoalsMap[weightvalue]?["calory"]);
            Navigator.push(
                context,
                MaterialPageRoute(
                    settings: RouteSettings(name: "/Page2"),
                    builder: ((context) => LevelPage())));
          },
          child: Icon(Icons.arrow_forward),
        ));
  }
}
