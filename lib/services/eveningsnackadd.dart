import 'package:diet_plan/views/DietHome.dart';
import 'package:diet_plan/views/add.dart';
import 'package:diet_plan/views/eveningsnack.dart';
import 'package:flutter/material.dart';

class eveningsnackadd extends SearchDelegate {
  List<SearchTerms> opted = [];
  final List<SearchTerms> searchTerms;
  final String name;

  eveningsnackadd({required this.searchTerms, required this.name});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        opted = [];
        for (var fruit in searchTerms) {
          if (fruit.isChecked == true) {
            opted.add(fruit);
          } else {
            opted.remove(fruit);
          }
        }
        print(opted.length);

        close(context, opted);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<SearchTerms> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return StatefulBuilder(
      builder: (context, setState) {
        return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            var result = matchQuery[index];
            return CheckboxListTile(
              title: Text(result.name!),
              value: searchTerms[index].isChecked,
              onChanged: (bool? value) {
                //searchTerms[index].isChecked = !value!;
                setState(() {
                  if (value!) {
                    opted.add(searchTerms[index]);
                  } else {
                    opted.remove(searchTerms[index]);
                  }
                  eveningsnackList[index].isChecked = value;
                });
              },
            );
          },
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<SearchTerms> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.name!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return StatefulBuilder(
      builder: (context, setState) {
        return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            var result = matchQuery[index];
            return CheckboxListTile(
              title: Text(result.name!),
              value: searchTerms[index].isChecked,
              onChanged: (bool? value) {
                //searchTerms[index].isChecked = !value!;
                setState(() {
                  if (value!) {
                    opted.add(searchTerms[index]);
                    sum += result.cal!;
                  } else {
                    opted.remove(searchTerms[index]);
                    sum -= result.cal!;
                  }

                  eveningsnackList[index].isChecked = value;
                });
              },
            );
          },
        );
      },
    );
  }
}
