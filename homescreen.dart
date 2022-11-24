import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "noteslistscreen.dart";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  const HomeScreen({Key? key}) : super(key: key);
}

class _HomeScreenState extends State<HomeScreen> {
  final firstController = TextEditingController();
  final lastcontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  List dataList = List.from([]);

  clearTextInput() {
    firstController.clear();
    lastcontroller.clear();
    addresscontroller.clear();
  }

  @override
  void initState() {
    save();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        TextField(
          controller: firstController,
          decoration: InputDecoration(hintText: "Enter First Name"),
        ),
        TextField(
          controller: lastcontroller,
          decoration: InputDecoration(hintText: "Enter Last Name"),
        ),
        TextField(
          controller: addresscontroller,
          decoration: InputDecoration(hintText: "Enter Address"),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            child: Text("Submit Data"),
            onPressed: () {
              Map<String, String> savevalue = {
                "firstData": firstController.text,
                "lastData": lastcontroller.text,
                "addressData": addresscontroller.text
              };
              debugPrint("savevalue ==========> ${savevalue.toString()}");
              dataList.add(savevalue);
              save();
            },
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: clearTextInput,
            child: Text('Clear Data'),
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            child: Text("view Data"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesListScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> save() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    debugPrint(
        "jsonEncode(dataList) ========> ${jsonEncode(dataList.toString())}");
    pref.setString("dataList", jsonEncode(dataList).toString());
  }

  void fetch() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      debugPrint("pref getString ========>${pref.getString("dataList")}");
      dataList = jsonDecode(pref.getString("dataList").toString());
    });
  }
}
