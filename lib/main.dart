import 'package:flutter/material.dart';
import 'package:test_project/forgot_pass.dart';
import 'package:test_project/home.dart';
import 'package:test_project/simple_login.dart';
import 'package:test_project/circle_image.dart';

class LoginModel {
  final String login;
  final String pass;

  LoginModel(this.login, this.pass);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 16),
              child: Column(
                children: <Widget>[
                  CircleImage(
                    height: 120,
                    imageName: "assets/flutter_logo.png",
                  ),
                  SimpleLogin(
                    (login, pass) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return HomePage(
                          loginModel: LoginModel(login, pass),
                        );
                      }));
                    },
                    forgotPasswordCallback: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ForgotPassword();
                      }));
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
