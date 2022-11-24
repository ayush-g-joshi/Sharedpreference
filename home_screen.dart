import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notes_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  const HomeScreen({Key? key}) : super(key: key);
}

class _HomeScreenState extends State<HomeScreen> {

  final firstController = TextEditingController();
  final lastcontroller = TextEditingController();
  final addresscontroller = TextEditingController();


  clearTextInput() {
    firstController.clear();
    lastcontroller.clear();
    addresscontroller.clear();
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

              firstData(firstController.text);
              lastData(lastcontroller.text);
              addressData(addresscontroller.text);

              },
            style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),),

          ),
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: clearTextInput,

            child: Text('Clear Data'),
            style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),),

          ),
        ),
        SizedBox(
          width: 200,
          child: ElevatedButton(
            child: Text("View Data"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesListScreen()),
              );
            },
            style: ElevatedButton.styleFrom(shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),),
          ),
        )
      ]),
    );
  }

  Future<void> firstData(firstvalue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("firstData", firstvalue);
  }

  Future<void> lastData(lastvalue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("lastData", lastvalue);
  }

  Future<void> addressData(addressvalue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("addressData", addressvalue);
  }
}
