import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  TextEditingController _event = new TextEditingController();
  TextEditingController _task = new TextEditingController();
  TextEditingController _alert = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Today's Event:"),
              Container(
                width: 100,
                child: TextField(
                  controller: _event,
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("ADD"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Company's Task:"),
              Container(
                width: 100,
                child: TextField(
                  controller: _task,
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("ADD"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Alert Message:"),
              Container(
                width: 100,
                child: TextField(
                  controller: _alert,
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("ADD"),
              ),
            ],  
          ),
           RaisedButton(
                onPressed: () {
                  insert_Data();
                },
                child: Text("Submit"),
              ),
        ],
      ),
    );
  }
  insert_Data() async {
    String url = "http://192.168.0.102/dgboardfiles/insert_data.php";
    try {
      var res = await http.post(Uri.parse(url), body: {
        "event": _event.text.toString(),
       "task":_task.text.toString(),
       "alertmsg":_alert.text.toString(),
      });
    } catch (e) {
      print("i am in catch");
      print(e);
    }
  }
}
