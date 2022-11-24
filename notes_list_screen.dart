import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesListScreen extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  String? firstvalue;
  String? lastvalue;
  String? addressvalue;

  @override
  void initState() {
    super.initState();
    firstnote();
    lastnote();
    addressnote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data Information"),
      ),
      body:
        
         Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), color: Colors.amber),
              child: Center(
                child: firstvalue == null
                    ? Text("No notes available")
                    : Text("First Name:-$firstvalue",
                        style: TextStyle(fontSize: 30)),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), color: Colors.amber),
              child: Center(
                child: lastvalue == null
                    ? Text("No notes available")
                    : Text("Last Name:-$lastvalue",
                        style: TextStyle(fontSize: 30)),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black), color: Colors.amber),
              child: Center(
                child: addressvalue == null
                    ? Text("No notes available")
                    : Text("Address:-$addressvalue",
                        style: TextStyle(fontSize: 30)),
              ),
            ),
          ],
        ),

    );
  }

  void firstnote() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    firstvalue = pref.getString("firstData");
    setState(() {});
  }

  void lastnote() async {
    final SharedPreferences pre = await SharedPreferences.getInstance();
    lastvalue = pre.getString("lastData");
    setState(() {});
  }

  void addressnote() async {
    final SharedPreferences pre = await SharedPreferences.getInstance();
    addressvalue = pre.getString("addressData");
    setState(() {});
  }
}
