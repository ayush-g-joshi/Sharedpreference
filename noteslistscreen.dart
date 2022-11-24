import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesListScreen extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  List data = List.from([]);

  @override
  void initState() {
    firstnote();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Data Information"),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return data.isEmpty
                    ? Container()
                    : Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.amber),
                            child: Center(
                              child: data[index]["firstData"] == null
                                  ? Text("No notes available")
                                  : Text(
                                      "First Name:-${data[index]["firstData"]}",
                                      style: TextStyle(fontSize: 30)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.amber),
                            child: Center(
                              child: data[index]["lastData"] == null
                                  ? Text("No notes available")
                                  : Text(
                                      "Last Name:-${data[index]["lastData"]}",
                                      style: TextStyle(fontSize: 30)),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.amber),
                            child: Center(
                              child: data[index]["addressData"] == null
                                  ? Text("No notes available")
                                  : Text(
                                      "Address:-${data[index]["addressData"]}",
                                      style: TextStyle(fontSize: 30)),
                            ),
                          ),
                        ],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  void firstnote() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      debugPrint("pref getString ========>${pref.getString("dataList")}");
      data = jsonDecode(pref.getString("dataList").toString());
    });
  }

}
