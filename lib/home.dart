import 'package:flutter/material.dart';
import 'package:test_project/main.dart';

class HomePage extends StatefulWidget {
  final LoginModel loginModel;

  HomePage({@required this.loginModel, Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController inputController = TextEditingController();
  String text = "";

  @override
  Widget build(BuildContext context) {
    List<String> _list = [
      "Username: " + this.widget.loginModel.login,
      "Password: " + this.widget.loginModel.pass
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                child: ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_list[index]),
                      );
                    }),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: inputController,
                decoration: InputDecoration(hintText: "Type anything"),
                onChanged: (value) {
                  setState(() {
                    this.text = value;
                  });
                },
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  Text(text ?? ""),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
